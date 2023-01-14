import 'package:clock_application_flutter/enums.dart';
import 'package:flutter/foundation.dart';

class MenuInfo extends ChangeNotifier{
  MenuType menuType;
  String? title;
  String? imageSource;
  
  MenuInfo(this.menuType, {  this.title,   this.imageSource});

  updateMenu(MenuInfo menuInfo){
    this.menuType = menuInfo.menuType;
    this.title = menuInfo.title;
    this.imageSource = menuInfo.imageSource;

    //important because whenever you update the model you have
    //to trigger this event to notify all the consumers listening to it
    notifyListeners();
  }
}  