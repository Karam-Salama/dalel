// ignore_for_file: file_names

import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/widgets/custom_btn.dart';
import 'package:dalel_app/features/auth/presentation/widgets/already_have_account_widget.dart';
import 'package:dalel_app/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel_app/features/auth/presentation/widgets/terms_and_conditions_widget.dart';
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
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 152)),
            const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: AppStrings.welcome)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.firstName)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.lastName)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.emailAddress)),
            const SliverToBoxAdapter(
                child: CustomTextField(labelText: AppStrings.password)),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: TermsAndConditionsWidget()),
            const SliverToBoxAdapter(child: SizedBox(height: 88)),
            SliverToBoxAdapter(
                child: CustomBtn(text: AppStrings.signUp, onPressed: () {})),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
                child: AlreadyHaveAccountWidget(
              textpart1: AppStrings.alreadyHaveAccount,
              textpart2: AppStrings.signIn,
              onPress: () {},
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 17)),
          ],
        ),
      ),
    );
  }
}
