sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoadingState extends LoginScreenState {}

final class LoginScreenSuccessState extends LoginScreenState {}

final class LoginScreenFailedState extends LoginScreenState {}

final class LoginScreenHidePasswordState extends LoginScreenState {}
