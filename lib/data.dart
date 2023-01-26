import 'package:clock_application_flutter/enums.dart';

import 'models/alarm_info.dart';
import 'models/menu_info.dart';
import 'themes/theme_data.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock, title: "Clock", 
  imageSource: 'assets/clockpngimage.png',  
  ),
  MenuInfo(MenuType.clock, title: "Alarm", 
  imageSource: 'assets/alarmpngimage.png',  
  ),
  MenuInfo(MenuType.clock, title: "Stop\nwatch", 
  imageSource: 'assets/timerpngicon.png',  
  ),
  MenuInfo(MenuType.clock, title: "Timer", 
  imageSource: 'assets/stopwatchpngicon.png',  
  ),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1,),), description: "Office", gradientColors: GradientColors.sky,),
  AlarmInfo(DateTime.now().add(const Duration(hours: 2,),), description: "Sports", gradientColors: GradientColors.sunset)

];