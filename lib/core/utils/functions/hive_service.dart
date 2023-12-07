






import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


Box? myBox;


Future<Box> openHiveBox(String boxName) async
{
//كدا انا بقوله لو هو مفتوح خد ال path وروح اعمله init
  if(!Hive.isBoxOpen(boxName))
  {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  //لو لا يبقي روح افتحه
  return await Hive.openBox(boxName);

}