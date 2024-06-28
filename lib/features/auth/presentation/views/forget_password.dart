import 'package:dalel_app/features/auth/presentation/widgets/custom_forget_password_form.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forget_password_image.dart';
import 'package:dalel_app/features/auth/presentation/widgets/forget_password_subtitle.dart';
import 'package:dalel_app/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(child: WelcomeTextWidget(text: 'Forget Password')),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgetPasswordImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgetPasswordSubtitleWidget()),
          SliverToBoxAdapter(child: SizedBox(height: 41)),
          SliverToBoxAdapter(child: CustomForgetPasswordForm()),
        ],
      ),
    );
  }
}
