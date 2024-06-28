import 'package:flutter/material.dart';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is ResetPasswordSuccessState) {
          CherryToast.success(
            inheritThemeColors: true,
            title: const Text("Check Your Email To Reset Your Password",
                style: TextStyle(color: Colors.black)),
            borderRadius: 0,
          ).show(context);
          customReplacementNavigate(context, '/signIn');
        } else if (state is ResetPasswordErrorState) {
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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.forgetPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                const SizedBox(height: 129),
                state is ResetPasswordLoadingState
                    ? const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        text: AppStrings.sendResetPasswordLink,
                        onPressed: () {
                          if (authCubit.forgetPasswordFormKey.currentState!
                              .validate()) {
                            authCubit.resetPasswordWithLink();
                          }
                        }),
                const SizedBox(height: 27),
              ],
            ),
          ),
        );
      },
    );
  }
}
