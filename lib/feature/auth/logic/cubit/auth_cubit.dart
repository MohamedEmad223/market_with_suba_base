import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  SupabaseClient client = Supabase.instance.client;

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      await client.auth.signInWithPassword(email: email, password: password);
      emit(LoginSuccess());
    } on AuthException catch (e) {
      emit(LoginFailed(e.message));
    } catch (e) {
      log(e.toString());
      emit(LoginFailed(e.toString()));
    }
  }

  Future<void> signUp({required String name,required String email,required String password}) async {
    emit(SignupLoading());
    try {
      await client.auth.signUp(email: email, password: password);
      emit(SignupSuccess());
    } on AuthException catch (e) {
      emit(SignupFailed(e.message));
    } catch (e) {
      log(e.toString());
      emit(SignupFailed(e.toString()));
    }
  }
}
