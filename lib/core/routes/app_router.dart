import 'package:dalel_app/features/auth/presentation/views/signIn_view.dart';
import 'package:dalel_app/features/auth/presentation/views/signUp_view.dart';
import 'package:dalel_app/features/on_Boarding/presentation/views/onBoarding_view.dart';
import 'package:dalel_app/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: '/onBoarding',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: '/signUp',
      builder: (context, state) => const SignUpView(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const SignInView(),
    ),
  ],
);
