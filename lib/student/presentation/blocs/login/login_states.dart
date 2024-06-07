abstract class LoginStates {
  const LoginStates();
}

class LoginInitialState extends LoginStates {}

///LoginStates

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {}

class LoginErrorState extends LoginStates {
  final String error;

  LoginErrorState(this.error);
}

///LogoutStates

class LogoutLoadingState extends LoginStates {}

class LogoutSuccessState extends LoginStates {}

class LogoutErrorState extends LoginStates {
  final String error;

  LogoutErrorState(this.error);
}
