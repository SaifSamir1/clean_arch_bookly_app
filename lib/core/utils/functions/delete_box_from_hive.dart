import 'package:bookly/core/entities/book_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

void deleteAllData({required String boxNamed}) async {
  var box = await Hive.openBox<BookEntity>(boxNamed);

  // Clear all data in the box
  await box.clear();

  if (kDebugMode) {
    print('All data in the box deleted successfully.');
  }

  // Close the box when done
}
