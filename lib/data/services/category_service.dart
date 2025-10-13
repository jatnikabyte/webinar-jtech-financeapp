import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/category_model.dart';

class CategoryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _categoriesRef => _firestore.collection('categories');

  Stream<List<CategoryModel>> getCategories() {
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

  Future<void> addCategory(CategoryModel category) async {
    await _categoriesRef.add(category.toJson());
  }

  Future<void> updateCategory(CategoryModel category) async {
    if (category.id != null) {
      await _categoriesRef.doc(category.id).update(category.toJson());
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    await _categoriesRef.doc(categoryId).delete();
  }
}
