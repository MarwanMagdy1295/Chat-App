import 'package:chat_app/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:chat_app/src/modules/chat_screen/presentation/ui/chat_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/src/app/di_service.dart';
import 'package:chat_app/src/core/services/prefs_service.dart';
import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      startLocale: Locale(di<PrefsService>().locale.get()),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          title: 'Security Zawahid',
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            /* dark theme settings */
          ),
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            fontFamily: 'Cairo',
            sliderTheme: const SliderThemeData(
              showValueIndicator: ShowValueIndicator.always,
              thumbColor: AppColors.lightGreen,
            ),
            primaryColor: AppColors.white,
            radioTheme: RadioThemeData(
              fillColor: MaterialStateProperty.all(AppColors.black),
            ),
            scaffoldBackgroundColor: AppColors.white,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.black,
              elevation: 0,
              titleTextStyle: AppTheme.textTheme.displayLarge,
              centerTitle: true,
              toolbarTextStyle:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
              foregroundColor: AppColors.white,
            ),
          ),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
