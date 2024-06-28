// ignore_for_file: file_names

import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_signIn_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(child: WelcomeBanner()),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcomeBack)),
        const SliverToBoxAdapter(child: SizedBox(height: 48)),
        const SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomSignInForm(),
        )),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: HaveAccountWidget(
            textpart1: AppStrings.dontHaveAccount,
            textpart2: AppStrings.signUp,
            onPress: () {
              customReplacementNavigate(context, '/signUp');
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 17)),
      ],
    ));
  }
}
