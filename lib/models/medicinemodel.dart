class MedicineModel {
  String image;
  String name;
  String ml;
  int rate;
  int off;
  String id;

  MedicineModel({
    required this.name,
    required this.image,
    required this.ml,
    required this.rate,
    required this.off,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'ml': this.ml,
      'off': this.off,
      'rate': this.rate,
      'id': this.id,
    };
  }

  factory MedicineModel.fromMap(Map<String, dynamic>map){
    return MedicineModel(
      rate: map['rate']?? "",
      ml: map['ml'] ?? "",
      image: map['image'] ?? "",
      off: map['off'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  MedicineModel copyWith({
    String? name,
    String? image,
    int? rate,
    int? off,
    String? ml,
    String? id,
  }) {
    return MedicineModel(
      name: name ?? this.name,
      image: image ?? this.image,
      id: id ?? this.id,
      ml: ml ?? this.ml,
      off: off ?? this.off,
      rate: rate ?? this.rate,
    );
  }
}
