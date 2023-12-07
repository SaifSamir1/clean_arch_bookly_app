






import '../../../constants.dart';
import 'hive_service.dart';

void selectingNextScreen() {
  if (selectingBooks =="true")
  {
    myBox!.put("selectingBooks", "true");
  }else
  {
    myBox!.put("selectingBooks", "false");
  }
}