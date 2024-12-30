import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'resetpassword_state.dart';

class ResetpasswordCubit extends Cubit<ResetpasswordState> {
  ResetpasswordCubit() : super(ResetpasswordInitial());
  SupabaseClient client = Supabase.instance.client;

  Future<void> resetPassword({required String email}) async {
    emit(ResetpasswordLoading());
    try {
      await client.auth.resetPasswordForEmail(email);
      emit(ResetpasswordSuccess());
    } on AuthException catch (e) {
      log(e.toString());
      emit(ResetpasswordFailed(e.message));
    } catch (e) {
      log(e.toString());
      emit(ResetpasswordFailed(e.toString()));
    }
  }
}
