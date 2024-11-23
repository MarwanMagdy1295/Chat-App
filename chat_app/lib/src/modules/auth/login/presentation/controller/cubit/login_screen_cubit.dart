import 'package:chat_app/src/modules/auth/otp_screen/presentation/ui/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/src/core/base_cubit/base_cubit.dart';
import 'package:chat_app/src/core/utils/assets/translations/keys.dart';
import 'package:chat_app/src/modules/auth/login/data/repositories/login_screen_repository.dart';
import 'package:chat_app/src/modules/auth/login/presentation/controller/cubit/login_screen_state.dart';
import 'package:chat_app/widget/custom_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreenCubit extends BaseCubit<LoginScreenState>
    with
        AdaptiveCubit<LoginScreenState>,
        ResetLazySingleton<LoginScreenCubit, LoginScreenState> {
  final LoginScreenRepository _loginScreenRepository;
  LoginScreenCubit({required LoginScreenRepository loginRepository})
      : _loginScreenRepository = loginRepository,
        super(LoginScreenInitial());

  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> postLoginData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      emit(LoginScreenLoadingState());
      await _auth.verifyPhoneNumber(
        phoneNumber: '+2${phoneController.text}',
        verificationCompleted: (PhoneAuthCredential credential) async {},
        codeSent: (String verificationId, int? resendToken) async {
          isLoading = false;
          emit(LoginScreenSuccessState());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OtpScreen(
                phone: phoneController.text,
                verificationId: verificationId,
              ),
            ),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          isLoading = false;
          emit(LoginScreenSuccessState());
          customToast(e.toString());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      customToast(general.please_fill_data.tr());
    }
  }
}
