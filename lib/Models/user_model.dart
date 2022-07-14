class User {
  late int userId;
  late String name;
  late String age;
  late int phoneNumber;
  late String email;
  late String password;
  late String token;

  User({required this.userId, required this.name, required this.age, required this.phoneNumber, required this.email,
      required this.password, required this.token});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
      userId: responseData['id'],
      name: responseData['name'],
      age: responseData['age'],
      phoneNumber: responseData['phone_number'],
      email: responseData['email'],
      password: responseData['password'],
      token: responseData['toker'],

    );
  }
}