import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';

// Best to only use this way to instantiate for static data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
