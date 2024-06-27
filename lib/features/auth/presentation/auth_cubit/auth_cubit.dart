// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? isTermsAndConditionsAccepted  = false;
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  signUpWithEmailAndPassword() async {
    try {
      // ? emit sign up loading state
      emit(SignUpLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      // * emit sign up success state
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ! emit sign up error state
        emit(SignUpErrorState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        // ! emit sign up error state
        emit(SignUpErrorState(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      // ! emit sign up error state
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }

  updateTermsAndConditionsCheckbox({required bool newValue}) {
    isTermsAndConditionsAccepted = newValue;
    emit(UpdateTermsAndConditionsState());
  }
}
