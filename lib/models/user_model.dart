class UserModel {
  final String? id;
  final String? name;
  final String? lastName;
  final String? email;
  final String? password;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.lastName,
    this.email,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      lastName: json['lastName'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastName': lastName,
      'email': email,
      'password': password,
      'token': token,
    };
  }
}