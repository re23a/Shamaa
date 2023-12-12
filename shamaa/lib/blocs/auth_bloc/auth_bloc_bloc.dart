import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_event.dart';
import 'package:shamaa/blocs/auth_bloc/auth_bloc_state.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  AuthBloc() : super(InitialState()) {
    on<SignUpEvent>(_signUp);
    on<LoginEvent>(_login);
    on<OTPEvent>(_otpVerify);
    on<CheckAuth>(_checkAuth);
  }

  Future<void> _signUp(SignUpEvent event, Emitter<AuthStates> emit) async {
    try {
      emit(LoadingSignUpState());
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        await supabaseClient.auth
            .signUp(email: event.email, password: event.password);
        emit(SuccessSignUpState());
      }
    } catch (error) {
      emit(ErrorSignUpState("Signup Error: ${error.toString()}"));
    }
  }

  FutureOr<void> _login(LoginEvent event, Emitter<AuthStates> emit) async {
    emit(LoadingLoginState());
    try {
      if (event.email.isNotEmpty && event.password.isNotEmpty) {
        final supabase = Supabase.instance.client;
        await supabase.auth
            .signInWithPassword(email: event.email, password: event.password);

        emit(SuccessLoginState());
      } else {
        emit(ErrorLoginState("Please enter all fields"));
      }
    } catch (e) {
      emit(ErrorLoginState("Error !!"));
    }
  }

  FutureOr<void> _otpVerify(OTPEvent event, Emitter<AuthStates> emit) async {
    emit(LoadingOtpState());
    try {
      if (event.otp.isNotEmpty) {
        final supabase = Supabase.instance.client;
        final authResponse = await supabase.auth.verifyOTP(
          token: event.otp,
          type: OtpType.signup,
          email: event.email,
        );

        print(Supabase.instance.client.auth.currentUser!.id);
        print(authResponse.user!.id);

        GetStorage authData = GetStorage('authLocalDataBase');
        await authData.write("token", authResponse.session!.accessToken);
        emit(SuccessOtpState());
      } else {
        emit(ErrorOtpState("Please enter otp"));
      }
    } catch (e) {
      print('Error during OTP verification: $e');
      emit(ErrorOtpState(e.toString()));
    }
  }

  FutureOr<void> _checkAuth(CheckAuth event, Emitter<AuthStates> emit) async {
    final supabaseClint = Supabase.instance.client;

    await Future.delayed(const Duration(seconds: 2), () async {
      if (supabaseClint.auth.currentSession != null) {
        final token = supabaseClint.auth.currentSession?.accessToken;
        final isExp = supabaseClint.auth.currentSession!.isExpired;
        if (token != null) {
          if (isExp) {
            await supabaseClint.auth
                .setSession(supabaseClint.auth.currentSession!.refreshToken!);
            emit(SuccessLoginCheck());
          } else {
            emit(SuccessLoginCheck());
          }
        } else {
          emit(ErrorLoginCheck());
        }
      } else {
        emit(ErrorLoginCheck());
      }
    });
  }
}
