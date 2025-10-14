import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _categoriesRef => _firestore.collection('categories');

  Stream<List<CategoryModel>> getAll() {
    return _categoriesRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => CategoryModel.fromJson(
                  doc.data() as Map<String, dynamic>,
                  doc.id,
                ),
              )
              .toList(),
        );
  }

  Future<void> add(CategoryModel category) async {
    await _categoriesRef.add(category.toJson());
  }

  Future<void> update(CategoryModel category) async {
    if (category.id != null) {
      await _categoriesRef.doc(category.id).update(category.toJson());
    }
  }

  Future<void> delete(String categoryId) async {
    await _categoriesRef.doc(categoryId).delete();
  }
}
