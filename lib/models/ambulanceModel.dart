class AmbulanceModel {
  String name;
  String id;
  int number;

  AmbulanceModel({
    required this.name,
    required this.number,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'number': this.number,
      'id': this.id,
    };
  }
  factory AmbulanceModel.fromMap(Map<String, dynamic>map){
    return AmbulanceModel(
      name: map['name'] ?? "",
      number: map['number'] ?? "",
      id: map['id'] ?? "",
    );
  }

  AmbulanceModel copyWith({
    String? name,
    String? id,
    int? number,
  }) {
    return AmbulanceModel(
      name: name ?? this.name,
      id: id ?? this.id,
      number: number ?? this.number,
    );
  }
}
