import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/app_constsnts.dart';
import '../../data/models/user_data_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      await getUserData();
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginFailed(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginFailed(e.toString()));
    }
  }

  Future<void> signUp(
      {required String name,
      required String email,
      required String password}) async {
    emit(SignupLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      await addUserData(name: name, email: email);
      await getUserData();
      emit(SignupSuccess());
    } on AuthException catch (e) {
      emit(SignupFailed(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignupFailed(e.toString()));
    }
  }

  GoogleSignInAccount? googleUser;
  Future<AuthResponse> nativeGoogleSignIn() async {
    emit(GoogleSignInLoading());
    const webClientId =
        '413135974201-tjr57ln3kbcln00flrs4b282gpk525e2.apps.googleusercontent.com';

    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: webClientId,
    );
    if (googleUser == null) {
      return AuthResponse();
    }

    googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      emit(GoogleSignInFailed());
      return AuthResponse();
    }

    AuthResponse response = await client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    await addUserData(name: googleUser!.displayName!, email: googleUser!.email);
    await getUserData();
    emit(GoogleSignInSuccess());
    return response;
  }

  Future<void> addUserData(
      {required String name, required String email}) async {
    emit(AddUserDataLoading());
    try {
      await client.from(AppConstsnts.usersColumn).upsert(
          {'id': client.auth.currentUser!.id, 'name': name, 'email': email});
      emit(AddUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddUserDataFailed(e.toString()));
    }
  }

  UserDataModel? userDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      var data = await client
          .from(AppConstsnts.usersColumn)
          .select()
          .eq("user_id", client.auth.currentUser!.id);

      userDataModel = UserDataModel.fromJson(data.first);
      emit(GetUserDataSuccess(userDataModel!));
    } catch (e) {
      log(e.toString());
      emit(GetUserDataFailed(e.toString()));
    }
  }
}
