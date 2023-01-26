import 'package:clock_application_flutter/screens/alarm_page.dart';
import 'package:clock_application_flutter/data.dart';
import 'package:clock_application_flutter/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:clock_application_flutter/models/menu_info.dart';

import 'clock_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    if (timezoneString.startsWith('-')) {}

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context, value, Widget? child) {
                if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                } else if(value.menuType == MenuType.clock){
                  return const ClockPage();
                }
                else {
                  return Container(
                    child: RichText(
                      text: TextSpan(
                          style: const TextStyle(fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: "this is ${value.title} page",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ]),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, Widget? child) {
        return SizedBox(
          height: 100,
          width: 70,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 5,
            ),
            color: currentMenuInfo.menuType == value.menuType
                ? const Color.fromARGB(255, 72, 80, 100)
                : Colors.transparent,
            child: TextButton(
              onPressed: () {
                var menuInfo = Provider.of<MenuInfo>(context, listen: false);
                menuInfo.updateMenu(currentMenuInfo);
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    currentMenuInfo.imageSource?? " ",
                    scale: 1.5,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    currentMenuInfo.title?? " ",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'avenir'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
