import '../../features/auth/presentation/auth_cubit/auth_cubit.dart';
import '../../features/auth/presentation/views/forget_password.dart';
import '../../features/auth/presentation/views/signIn_view.dart';
import '../../features/auth/presentation/views/signUp_view.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/on_Boarding/presentation/views/onBoarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: '/signIn',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: '/forgetPassword',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const ForgetPassword(),
      ),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
  ],
);
