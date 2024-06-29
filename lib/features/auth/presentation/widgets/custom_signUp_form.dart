// ignore_for_file: file_names

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel_app/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/terms_and_conditions_widget.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) {
        if (state is SignUpSuccessState) {
          CherryToast.success(
            inheritThemeColors: true,
            title: const Text("Successfully, Check Your Email To Verify Your Account",
                style: TextStyle(color: Colors.black)),
            borderRadius: 0,
          ).show(context);
          Future.delayed(const Duration(seconds: 2), () {
            customReplacementNavigate(context, '/signIn');
          });
        } else if (state is SignUpErrorState) {
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
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.firstName,
                onChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
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
              const TermsAndConditionsWidget(),
              const SizedBox(height: 88),
              state is SignUpLoadingState
                  ? const CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomBtn(
                      text: AppStrings.signUp,
                      color: authCubit.isTermsAndConditionsAccepted == false
                          ? AppColors.grey
                          : null,
                      onPressed: () async{
                        if (authCubit.isTermsAndConditionsAccepted == true) {
                          if (authCubit.signUpFormKey.currentState!
                              .validate()) {
                            await authCubit.signUpWithEmailAndPassword();
                          }
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
