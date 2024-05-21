class MedicineModel {
  String name;
  String ml;
  String rate;
  String id;

  MedicineModel({
    required this.name,
    required this.ml,
    required this.rate,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'ml': this.ml,
      'rate': this.rate,
      'id': this.id,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic>map){
    return MedicineModel(
      rate: map['location'] ?? "",
      ml: map['ml'] ?? "",
      name: map['rate'] ?? "",
      id: map['id'] ?? "",
    );
  }

  MedicineModel copyWith({
    String? name,
    String? location,
    String? spcl,
    String? id,
  }) {
    return MedicineModel(
      name: name ?? this.name,
      id: id ?? this.id,
      ml: spcl ?? this.ml,
      rate: location ?? this.rate,
    );
  }
}
