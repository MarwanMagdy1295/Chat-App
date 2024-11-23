// ignore_for_file: use_build_context_synchronously

import 'package:chat_app/src/core/services/secure_storge.dart';
import 'package:chat_app/src/modules/chat_screen/presentation/ui/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/core/base_cubit/base_cubit.dart';
import 'package:chat_app/src/modules/auth/otp_screen/data/repositories/verify_screen_repository.dart';
import 'package:chat_app/src/modules/auth/otp_screen/presentation/controller/otp_screen_state.dart';
import 'package:chat_app/widget/custom_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:chat_app/src/core/utils/assets/translations/keys.dart';

class OtpScreenCubit extends BaseCubit<OtpScreenState>
    with
        AdaptiveCubit<OtpScreenState>,
        ResetLazySingleton<OtpScreenCubit, OtpScreenState> {
  final VerifyScreenRepository _verifyScreenRepository;

  OtpScreenCubit({required VerifyScreenRepository verifyScreenRepository})
      : _verifyScreenRepository = verifyScreenRepository,
        super(OtpScreenInitial());

  TextEditingController controller = TextEditingController();
  bool isLoading = false;
  String phone = '';
  String verificationId = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyCode(BuildContext context) async {
    if (controller.text.isNotEmpty) {
      try {
        isLoading = true;
        emit(OtpScreenLoadingState());
        final credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: controller.text);
        await _auth.signInWithCredential(credential);
        SecureStorage().writeSecureData('token', credential.token.toString());
        // di<PrefsService>().token.put(credential.token.toString());
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            ),
            (route) => false);
        isLoading = true;
        emit(OtpScreenSuccessState());
      } catch (e) {
        customToast(e.toString());
      }
    } else {
      customToast(otp_screen.please_enter_code.tr());
    }
  }

  // Future<void> sendEmail(BuildContext context) async {
  //   var response;

  //   isLoading = true;
  //   emit(OtpScreenLoadingState());
  //   await _verifyScreenRepository
  //       .forgetPasswordSendEmail(
  //     email: email,
  //   )
  //       .then((value) {
  //     response = value;
  //     isLoading = false;
  //     emit(OtpScreenSuccessState());
  //     customToast(response.data['message']);
  //   }).catchError((onError) {
  //     isLoading = false;
  //     emit(OtpScreenFailedState());
  //     log('ForgetPassword error=>  $onError');
  //     customToast(onError.message ?? '');
  //     // if (onError is SingleMessageResponseErrorModel ||
  //     //     onError is UnauthorizedResponseErrorModel) {
  //     //   customToast(onError.message ?? '');
  //     // }
  //     // if (onError is UnexpectedErrorModel) {
  //     //   customToast(general.some_thing_went_wrong.tr());
  //     // }
  //   });
  // }
}
