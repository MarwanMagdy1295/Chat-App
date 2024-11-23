import 'package:chat_app/src/modules/auth/login/data/data_source/login_screen_remote_data_source.dart';
import 'package:chat_app/src/modules/auth/login/data/model/client_types_model.dart';

abstract class LoginScreenRepositoryInterface {
  Future<ClientTypesModel?> clientTypes();
  Future login({
    required String email,
    required String password,
    required String selectedClient,
  });
}

class LoginScreenRepository extends LoginScreenRepositoryInterface {
  final LoginScreenRemoteDataSource _loginRemoteDataSource;

  LoginScreenRepository({
    required LoginScreenRemoteDataSource loginScreenRemoteDataSource,
  }) : _loginRemoteDataSource = loginScreenRemoteDataSource;

  @override
  Future login(
      {required String email,
      required String password,
      required String selectedClient}) {
    return _loginRemoteDataSource.login(
        email: email, password: password, selectedClient: selectedClient);
  }

  @override
  Future<ClientTypesModel?> clientTypes() {
    return _loginRemoteDataSource.clientTypes();
  }
}
