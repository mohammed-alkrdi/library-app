class SignUpBody {
  String name;
  String age;
  String phoneNumber;
  String email;
  String password;

  SignUpBody({
      required this.name,
      required this.age,
      required this.phoneNumber,
      required this.email,
      required this.password
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["age"] = age;
    data["phone_number"] = phoneNumber;
    data["email"] = email;
    data["password"] = password;
    return data;
  }
}
