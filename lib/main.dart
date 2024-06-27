// ignore_for_file: avoid_print

import 'package:dalel_app/app/dalel_app.dart';
import 'package:dalel_app/core/database/cache/cache_helper.dart';
import 'package:dalel_app/core/functions/check_state_changes_fun.dart';
import 'package:dalel_app/core/services/service_locator.dart';
import 'package:dalel_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// MVVM Architecture => Model, View, ViewModel(Bloc_State_Management)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(const Dalel());
}
