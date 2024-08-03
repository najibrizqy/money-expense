import 'package:flutter/material.dart';
import 'package:money_expense/src/features/expense/data/master_category.dart';
import 'package:money_expense/src/features/expense/domain/category.dart';

Color getColorBasedOnCategory(String categoryTitle) {
  // Find the category that matches the provided title
  Category? category = masterCategory.firstWhere(
    (cat) => cat.title == categoryTitle,
  );

  // If a matching category is found, return its color; otherwise, return a default color
  return category.color;
}

String getImagesBasedOnCategory(String categoryTitle) {
  // Find the category that matches the provided title
  Category? category = masterCategory.firstWhere(
    (cat) => cat.title == categoryTitle,
  );

  // If a matching category is found, return its color; otherwise, return a default color
  return category.images;
}
