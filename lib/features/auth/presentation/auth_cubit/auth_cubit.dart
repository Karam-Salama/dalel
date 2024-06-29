// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool? isTermsAndConditionsAccepted = false;
  bool? obscurePasswordTextValue = true;
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();

  signUpWithEmailAndPassword() async {
    try {
      // ? emit sign up loading state
      emit(SignUpLoadingState());

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      verifyEmail();
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
      if (e.code == 'invalid-email') {
        // ! emit sign up error state
        emit(SignUpErrorState(errorMessage: 'Invalid email address.'));
      } else {
        // ! emit sign up error state
        emit(SignUpErrorState(errorMessage: e.toString()));
      }
    } catch (e) {
      // ! emit sign up error state
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  updateTermsAndConditionsCheckbox({required bool newValue}) {
    isTermsAndConditionsAccepted = newValue;
    emit(UpdateTermsAndConditionsState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  signInWithEmailAndPassword() async {
    try {
      // ? emit sign in loading state
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      // * emit sign in success state
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ! emit sign in error state
        emit(SignInErrorState(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        // ! emit sign in error state
        emit(SignInErrorState(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        // ! emit sign in error state
        emit(SignInErrorState(errorMessage: "Check your email and password"));
      }
    } catch (e) {
      // ! emit sign in error state
      emit(SignInErrorState(errorMessage: e.toString()));
    }
  }

  resetPasswordWithLink() async {
    try {
      // ? emit reset password loading state
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      // * emit reset password success state
      emit(ResetPasswordSuccessState());
    } catch (e) {
      // ! emit reset password error state
      emit(ResetPasswordErrorState(errorMessage: e.toString()));
    }
  }
}
