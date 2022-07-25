class EditProfileBody {
  String? name;
  String? age;
  String? phoneNumber;
  String? email;
  String token;

  EditProfileBody(
      {this.name, this.age, this.phoneNumber, this.email, required this.token});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["age"] = age;
    data["phone_number"] = phoneNumber;
    data["email"] = email;
    return data;
  }
}
