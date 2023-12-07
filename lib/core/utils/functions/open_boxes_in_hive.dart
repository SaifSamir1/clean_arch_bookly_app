import 'package:hive/hive.dart';

import '../../../constants.dart';
import '../../entities/book_entity.dart';
import 'hive_service.dart';

Future<void> openBoxesInHive() async {
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);
  await Hive.openBox<BookEntity>(kSimilarBox);
  await Hive.openBox<BookEntity>(kSearchedBox);
  myBox = await openHiveBox("saifBox");
}
