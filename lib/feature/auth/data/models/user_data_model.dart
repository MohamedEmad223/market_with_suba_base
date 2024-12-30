class UserDataModel {
  final String id;
  final String email;
  final String name;

  UserDataModel({
    required this.id,
    required this.email,
    required this.name,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }
}
