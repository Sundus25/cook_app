class UserModel {
  String email;
  String password;
  UserModel({
    required this.email,
    required this.password,
  });

  toMap() {
    return {
      "username": email,
      "password": password,
    };
  }
}

