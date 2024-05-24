class MedicineModel {
  String name;
  double ml;
  double rate;
  double off;
  String id;

  MedicineModel({
    required this.name,
    required this.ml,
    required this.rate,
    required this.off,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'ml': this.ml,
      'off': this.off,
      'rate': this.rate,
      'id': this.id,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic>map){
    return MedicineModel(
      rate: map['rate'].toDouble() ?? "",
      ml: map['ml'].toDouble() ?? "",
      off: map['off'].toDouble() ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  MedicineModel copyWith({
    String? name,
    double? rate,
    double? off,
    double? ml,
    String? id,
  }) {
    return MedicineModel(
      name: name ?? this.name,
      id: id ?? this.id,
      ml: ml ?? this.ml,
      off: off ?? this.off,
      rate: rate ?? this.rate,
    );
  }
}
