class DoctorModel {
  String name;
  String spcl;
  String location;
  String id;

  DoctorModel({
    required this.name,
    required this.spcl,
    required this.location,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'spcl': this.spcl,
      'location': this.location,
      'id': this.id,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic>map){
    return DoctorModel(
      location: map['location'] ?? "",
      spcl: map['spcl'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  DoctorModel copyWith({
    String? name,
    String? location,
    String? spcl,
    String? id,
  }) {
    return DoctorModel(
      name: name ?? this.name,
      id: id ?? this.id,
      spcl: spcl ?? this.spcl,
      location: location ?? this.location,
    );
  }
}
