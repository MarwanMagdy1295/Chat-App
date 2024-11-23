import 'package:chat_app/src/modules/auth/otp_screen/data/data_source/verify_screen_remote_data_source.dart';

abstract class VerifyScreenRepositoryInterface {
  Future verify({required String code, required String email});
  // Future forgetPasswordSendEmail({required String email});
}

class VerifyScreenRepository extends VerifyScreenRepositoryInterface {
  final VerifyScreenRemoteDataSource _verifyRemoteDataSource;

  VerifyScreenRepository({
    required VerifyScreenRemoteDataSource verifyScreenRemoteDataSource,
  }) : _verifyRemoteDataSource = verifyScreenRemoteDataSource;

  @override
  Future verify({required String code, required String email}) {
    return _verifyRemoteDataSource.verify(code: code, email: email);
  }

  // @override
  // Future forgetPasswordSendEmail({required String email}) {
  //   return _verifyRemoteDataSource.forgetPasswordSendEmail(email: email);
  // }
}
