import 'package:chat_app/src/core/api/error_handler.dart';
import 'package:chat_app/src/core/api/network_service.dart';

abstract class VerifyScreenRemoteDataSourceInterface {
  Future verify({
    required String code,
    required String email,
  });
  // Future forgetPasswordSendEmail({required String email});
}

class VerifyScreenRemoteDataSource
    extends VerifyScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  VerifyScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future verify({
    required String code,
    required String email,
  }) async {
    try {
      final res = await _networkService.postData(
          url: 'accounts/password-reset/verify/',
          token: false,
          data: {
            "email": email,
            "reset_code": code,
          });
      return res;
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }

  // @override
  // Future forgetPasswordSendEmail({required String email}) async {
  //   try {
  //     final res = await ForgetPasswordScreenRepository(
  //             forgetPasswordScreenRemoteDataSource: di())
  //         .forgetPasswordSendEmail(email: email);
  //     return res;
  //   } catch (e) {
  //     throw ErrorModel.parse(e);
  //   }
  // }
}
