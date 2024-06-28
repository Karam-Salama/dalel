import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/app_functions.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/core/utils/app_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isVisited = getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isVisited == true) {
      FirebaseAuth.instance.currentUser == null ?  delayedNavigate(context,'/signUp') : delayedNavigate(context,'/home') ;
    } else {
      delayedNavigate(context,'/onBoarding');
    }
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(AppStrings.appName, style: AppTextStyle.pacifico400style64),
      ),
    );
  }
}
