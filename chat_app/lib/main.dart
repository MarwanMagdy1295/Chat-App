import 'dart:io';

import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/src/app/app_layout.dart';
import 'package:chat_app/src/app/di_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Firebase.initializeApp();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp();
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  await DiService.init();
  runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const AppLayout(),
      // ),
      const AppLayout());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
