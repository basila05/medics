class HsptlModel {
  String name;
  String image;
  String id;

  HsptlModel({
    required this.name,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'image': this.image,
      'id': this.id,
    };
  }

  factory HsptlModel.fromMap(Map<String, dynamic>map){
    return HsptlModel(
      image: map['image'] ?? "",
      name: map['name'] ?? "",
      id: map['id'] ?? "",
    );
  }

  HsptlModel copyWith({
    String? name,
    String? image,
    String? id,
  }) {
    return HsptlModel(
      name: name ?? this.name,
      id: id ?? this.id,
      image: image ?? this.image,
    );
  }
}
