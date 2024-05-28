class DoctorModel {
  String name;
  String spcl;
  String exp;
  String id;

  DoctorModel({
    required this.name,
    required this.spcl,
    required this.exp,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'spcl': this.spcl,
      'exp': this.exp,
      'id': this.id,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic>map){
    return DoctorModel(
      exp: map['exp'] ?? "",
      spcl: map['spcl'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  DoctorModel copyWith({
    String? name,
    String? exp,
    String? spcl,
    String? id,
  }) {
    return DoctorModel(
      name: name ?? this.name,
      id: id ?? this.id,
      spcl: spcl ?? this.spcl,
      exp: exp ?? this.exp,
    );
  }
}
