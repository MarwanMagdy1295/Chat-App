import 'package:chat_app/src/core/api/error_handler.dart';
import 'package:chat_app/src/core/api/network_service.dart';
import 'package:chat_app/src/modules/auth/login/data/model/client_types_model.dart';
import 'package:chat_app/src/modules/auth/login/data/model/login_model.dart';

abstract class LoginScreenRemoteDataSourceInterface {
  Future<LoginModel?> login(
      {required String email,
      required String password,
      required String selectedClient});

  Future<ClientTypesModel?> clientTypes();
}

class LoginScreenRemoteDataSource extends LoginScreenRemoteDataSourceInterface {
  final NetworkService _networkService;

  LoginScreenRemoteDataSource({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<LoginModel?> login({
    required String email,
    required String password,
    required String selectedClient,
  }) async {
    try {
      final res = await _networkService.postData(
        url: 'accounts/login/',
        token: false,
        data: {"username": email, "password": password},
        // query: {'Tenant-Name': selectedClient},
      );
      return LoginModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }

  @override
  Future<ClientTypesModel?> clientTypes() async {
    try {
      final res = await _networkService.getData(
        url: 'clients',
        token: false,
      );
      return ClientTypesModel.fromJson(res.data);
    } catch (e) {
      throw ErrorModel.parse(e);
    }
  }
}
