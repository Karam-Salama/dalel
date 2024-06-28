// ignore_for_file: file_names

import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_signUp_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 152)),
            const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.welcome)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: CustomSignUpForm()),
            SliverToBoxAdapter(
                child: HaveAccountWidget(
              textpart1: AppStrings.alreadyHaveAccount,
              textpart2: AppStrings.signIn,
              onPress: () {
                customReplacementNavigate(context, '/signIn');
              },
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 17)),
          ],
        ),
      ),
    );
  }
}
