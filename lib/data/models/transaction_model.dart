class TransactionModel {
  final String? id;
  final String categoryId;
  final String categoryName;
  final double amount;
  final String type;
  final DateTime date;
  final String notes;
  final DateTime createdAt;

  TransactionModel({
    this.id,
    required this.categoryId,
    required this.categoryName,
    required this.amount,
    required this.type,
    required this.date,
    required this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'amount': amount,
      'type': type,
      'date': date.toIso8601String(),
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json, String id) {
    return TransactionModel(
      id: id,
      categoryId: json['categoryId'] ?? '',
      categoryName: json['categoryName'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      type: json['type'] ?? '',
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(),
      notes: json['notes'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  TransactionModel copyWith({
    String? id,
    String? categoryId,
    String? categoryName,
    double? amount,
    String? type,
    DateTime? date,
    String? notes,
    DateTime? createdAt,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
