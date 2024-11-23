import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:chat_app/src/app/di_service.dart';
import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:chat_app/src/core/utils/assets/translations/keys.dart';
import 'package:chat_app/src/core/utils/constants.dart';
import 'package:chat_app/src/modules/auth/login/presentation/ui/login_screen.dart';
import 'package:chat_app/src/modules/auth/otp_screen/presentation/controller/otp_screen_cubit.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/loading_widget.dart';
import 'dart:ui' as ui;

class OtpScreen extends StatefulWidget {
  final String phone;
  final String verificationId;
  const OtpScreen(
      {super.key, required this.phone, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int _countDown = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          OtpScreenCubit(verifyScreenRepository: di()),
      lazy: true,
      child: Builder(
        builder: (context) {
          final cubit = context.watch<OtpScreenCubit>();
          cubit.phone = widget.phone;
          cubit.verificationId = widget.verificationId;
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Constatnts.height60,
                          Text(
                            forget_password_screen.forget_password.tr(),
                            style: AppTheme.textTheme.displaySmall!.copyWith(
                              color: AppColors.grey25,
                              fontSize: 20.0.sp,
                            ),
                          ),
                          Constatnts.height6,
                          Text(
                            forget_password_screen.send_verification.tr(),
                            style: AppTheme.textTheme.displaySmall!.copyWith(
                              color: AppColors.grey25,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0.sp,
                            ),
                          ),
                          Constatnts.height6,
                          Text(
                            cubit.phone,
                            style: AppTheme.textTheme.displaySmall!.copyWith(
                              color: AppColors.grey25,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0.sp,
                            ),
                          ),
                          Constatnts.height30,
                          Directionality(
                            textDirection: ui.TextDirection.ltr,
                            child: PinCodeTextField(
                              controller: cubit.controller,
                              keyboardType: TextInputType.number,
                              enablePinAutofill: true,
                              autoFocus: true,
                              length: 6,
                              obscureText: false,
                              animationType: AnimationType.slide,
                              onSaved: (v) {},
                              enableActiveFill: true,
                              hintCharacter: '0',
                              textStyle:
                                  AppTheme.textTheme.displayLarge!.copyWith(
                                color: AppColors.grey25,
                                fontSize: 26.0.sp,
                              ),
                              pinTheme: PinTheme(
                                fieldHeight: 60.0.h,
                                fieldWidth:
                                    MediaQuery.of(context).size.width.w / 7.5,
                                selectedFillColor: AppColors.transparent,
                                selectedColor: AppColors.grey25,
                                borderRadius: BorderRadius.circular(8.0.r),
                                borderWidth: 1,
                                inactiveColor: AppColors.grey25,
                                activeColor: AppColors.grey25,
                                inactiveFillColor: AppColors.transparent,
                                shape: PinCodeFieldShape.box,
                                activeFillColor: AppColors.transparent,
                                errorBorderColor: AppColors.red,
                                disabledColor: AppColors.grey25,
                              ),
                              appContext: context,
                              onChanged: (String value) {},
                            ),
                          ),
                          Constatnts.height30,
                          customButton(
                            onTap: () {
                              cubit.verifyCode(context);
                            },
                            title: forget_password_screen.verify_email.tr(),
                            titleStyle:
                                AppTheme.textTheme.headlineMedium?.copyWith(
                              color: AppColors.grey25,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.all(14.0),
                          ),
                          SizedBox(
                            height: 42.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                forget_password_screen.recive_email.tr(),
                                style:
                                    AppTheme.textTheme.headlineMedium!.copyWith(
                                  color: AppColors.grey25,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0.sp,
                                ),
                              ),
                              if (_countDown == 0)
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _countDown = 60;
                                      startTimer();
                                    });
                                    // cubit.sendEmail(context);
                                  },
                                  child: Text(
                                    ' ${forget_password_screen.resend.tr()}',
                                    style: AppTheme.textTheme.headlineMedium!
                                        .copyWith(
                                      color: AppColors.grey25,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0.sp,
                                    ),
                                  ),
                                ),
                              if (_countDown > 0)
                                Text(
                                  _countDown > 9 && _countDown > 0
                                      ? ' 00:$_countDown'
                                      : ' 00:0$_countDown',
                                  style: AppTheme.textTheme.headlineMedium!
                                      .copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                            ],
                          ),
                          Constatnts.height16,
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                  (route) => false);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Center(
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: AppColors.grey25,
                                    size: 16.0,
                                  ),
                                ),
                                Constatnts.width8,
                                Text(
                                  forget_password_screen.back_to_login.tr(),
                                  style: AppTheme.textTheme.headlineMedium
                                      ?.copyWith(
                                    color: AppColors.grey25,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Constatnts.height10,
                        ],
                      ),
                    ),
                  ),
                  if (cubit.isLoading)
                    Container(
                      height: MediaQuery.sizeOf(context).height.h,
                      width: MediaQuery.sizeOf(context).width.w,
                      color: AppColors.grey25.withOpacity(.2),
                      child: Center(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * .16.h,
                          width: MediaQuery.sizeOf(context).width * .4.w,
                          child: const LoadingWidget(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
