import 'package:clock_application_flutter/screens/alarm_page.dart';
import 'package:clock_application_flutter/enums.dart';
import 'package:clock_application_flutter/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clock_application_flutter/models/menu_info.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (BuildContext context) => MenuInfo(
                MenuType.clock,
              ),
          child: const Homepage()),
    );
  }
}
