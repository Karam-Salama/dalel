// ignore_for_file: file_names

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forget_password_text_widget.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is SignInSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified == true
              ? customReplacementNavigate(context, '/home')
              : CherryToast.warning(
                  description: const Text("Please Verify Your Email Address",
                      style: TextStyle(color: Colors.black)),
                  animationType: AnimationType.fromLeft,
                ).show(context);
        } else if (state is SignInErrorState) {
          CherryToast.error(
            inheritThemeColors: true,
            title: Text(state.errorMessage,
                style: const TextStyle(color: Colors.black)),
            borderRadius: 0,
          ).show(context);
        }
      },
      builder: (BuildContext context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signInFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(height: 16),
              const ForgetPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SignInLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomBtn(
                      text: AppStrings.signIn,
                      onPressed: () {
                        if (authCubit.signInFormKey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      }),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
