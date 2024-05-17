class UsersModel {
  String name;
  String email;
  String password;
  String id;

  UsersModel({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'password': this.password,
      'id': this.id,
    };
  }

  factory UsersModel.fromMap(Map<String, dynamic>map){
    return UsersModel(
      password: map['password'] ?? "",
      email: map['email'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  UsersModel copyWith({
    String? name,
    String? password,
    String? email,
    String? id,
  }) {
    return UsersModel(
      name: name ?? this.name,
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
