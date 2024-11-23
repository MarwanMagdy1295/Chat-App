import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/src/app/di_service.dart';
import 'package:chat_app/src/core/utils/app_colors.dart';
import 'package:chat_app/src/core/utils/app_theme.dart';
import 'package:chat_app/src/core/utils/assets/translations/keys.dart';
import 'package:chat_app/src/core/utils/constants.dart';
import 'package:chat_app/src/modules/auth/login/presentation/controller/cubit/login_screen_cubit.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_text_form_field.dart';
import 'package:chat_app/widget/loading_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          LoginScreenCubit(firebaseAuthService: di()),
      lazy: true,
      child: Builder(
        builder: (context) {
          final cubit = context.watch<LoginScreenCubit>();
          return Scaffold(
            // backgroundColor: Colors.white,
            floatingActionButton: Container(
              margin:
                  EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 20.0.h),
              child: customButton(
                onTap: () {
                  cubit.postLoginData(context);
                },
                title: login_screen.login.tr(),
                titleStyle: AppTheme.textTheme.displayMedium?.copyWith(
                  color: AppColors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0.r),
                ),
                backgroundColor: AppColors.secondry,
                padding: const EdgeInsets.all(14.0),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            body: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: SafeArea(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 20.0.h),
                      padding: EdgeInsets.all(20.0.w),
                      // decoration: BoxDecoration(
                      // color: AppColors.lightGreen.withOpacity(.15),
                      // borderRadius: BorderRadius.all(
                      //   Radius.circular(20.r),
                      // ),
                      // ),
                      child: Form(
                        key: cubit.formKey,
                        child: SingleChildScrollView(
                          padding: EdgeInsets.only(bottom: 20.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Constatnts.height60,
                              Text(
                                login_screen.welcome_back.tr(),
                                style:
                                    AppTheme.textTheme.displayMedium!.copyWith(
                                  color: AppColors.white,
                                  fontSize: 20.0.sp,
                                ),
                              ),
                              Constatnts.height10,
                              Text(
                                login_screen.please_enter_your_data.tr(),
                                style:
                                    AppTheme.textTheme.displaySmall!.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0.sp,
                                ),
                              ),
                              Constatnts.height30,
                              customTextFeild(
                                controller: cubit.phoneController,
                                title: login_screen.phone.tr(),
                                isTitileAviable: true,
                                hint: login_screen.phone.tr(),
                                hintStyle:
                                    AppTheme.textTheme.headlineMedium?.copyWith(
                                  color: AppColors.hintColor,
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                titleStyle:
                                    AppTheme.textTheme.headlineMedium?.copyWith(
                                  color: AppColors.white,
                                  fontSize: 14.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                contentStyle:
                                    AppTheme.textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.white,
                                  fontSize: 16.0.sp,
                                ),
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 14.0,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.white,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return login_screen.please_enter_phone.tr();
                                  }
                                  return null;
                                },
                              ),
                              Constatnts.height10,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (cubit.isLoading)
                  Container(
                    height: MediaQuery.sizeOf(context).height.h,
                    width: MediaQuery.sizeOf(context).width.w,
                    color: AppColors.white.withOpacity(.2),
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
          );
        },
      ),
    );
  }
}
