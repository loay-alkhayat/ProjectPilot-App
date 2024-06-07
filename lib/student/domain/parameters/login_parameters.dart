class LoginParameters {
  final String email;
  final String password;

  LoginParameters({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email' : email,
    'password' : password,
  };

}