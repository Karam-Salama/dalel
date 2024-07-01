import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/functions/app_functions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_state.dart';
import 'custom_text_field.dart';

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
                        onPressed: () async{
                          if (authCubit.forgetPasswordFormKey.currentState!
                              .validate()) {
                            await authCubit.resetPasswordWithLink();
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
