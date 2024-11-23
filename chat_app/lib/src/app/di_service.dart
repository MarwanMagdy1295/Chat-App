import 'package:chat_app/src/modules/auth/login/data/data_source/login_screen_remote_data_source.dart';
import 'package:chat_app/src/modules/auth/login/data/repositories/login_screen_repository.dart';
import 'package:chat_app/src/modules/auth/login/presentation/controller/cubit/login_screen_cubit.dart';
import 'package:chat_app/src/modules/auth/otp_screen/data/data_source/verify_screen_remote_data_source.dart';
import 'package:chat_app/src/modules/auth/otp_screen/data/repositories/verify_screen_repository.dart';
import 'package:chat_app/src/modules/auth/otp_screen/presentation/controller/otp_screen_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:chat_app/src/core/api/network_service.dart';
import 'package:chat_app/src/core/services/prefs_service.dart';

final di = GetIt.instance;

class DiService {
  static init() async {
    // router
    // di.registerLazySingleton(() => AppRouter());

    // PrefsService
    di.registerLazySingleton(() => PrefsService());
    await di<PrefsService>().init();

    // NetworkService
    di.registerLazySingleton(
      () => NetworkService(
        prefsService: di(),
      ),
    );

    // splashScreen
    // di.registerLazySingleton(
    //   () => AppVersionRemoteDataSource(
    //     networkService: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => AppVersionRepository(
    //     appVersionRemoteDataSource: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SplashCubitDartCubit(
    //     appVersionRepository: di(),
    //   ),
    // );

    // LandingScreen
    di.registerLazySingleton(
      () => LoginScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => LoginScreenRepository(
        loginScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => LoginScreenCubit(
        loginRepository: di(),
      ),
    );
    // OTPScreen
    di.registerLazySingleton(
      () => VerifyScreenRemoteDataSource(
        networkService: di(),
      ),
    );
    di.registerLazySingleton(
      () => VerifyScreenRepository(
        verifyScreenRemoteDataSource: di(),
      ),
    );
    di.registerLazySingleton(
      () => OtpScreenCubit(
        verifyScreenRepository: di(),
      ),
    );
  }
}
