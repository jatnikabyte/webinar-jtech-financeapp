class CategoryModel {
  final String? id;
  final String name;
  final DateTime createdAt;

  CategoryModel({this.id, required this.name, required this.createdAt});

  Map<String, dynamic> toJson() {
    return {'name': name, 'createdAt': createdAt.toIso8601String()};
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json, String id) {
    return CategoryModel(
      id: id,
      name: json['name'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  CategoryModel copyWith({String? id, String? name, DateTime? createdAt}) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
