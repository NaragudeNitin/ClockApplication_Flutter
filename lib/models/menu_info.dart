import 'package:clock_application_flutter/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String? title;
  String? imageSource;
  
  MenuInfo(this.menuType, {  this.title,   this.imageSource});

  updateMenu(MenuInfo menuInfo){
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    imageSource = menuInfo.imageSource;

    //important because whenever you update the model you have
    //to trigger this event to notify all the consumers listening to it
    notifyListeners();
  }
}  