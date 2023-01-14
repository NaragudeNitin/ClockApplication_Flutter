import 'package:clock_application_flutter/data.dart';
import 'package:clock_application_flutter/enums.dart';
import 'package:clock_application_flutter/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:clock_application_flutter/menu_info.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (timezoneString.startsWith('-')) {
      offsetSign = '+';
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) => buildMenuButton(currentMenuInfo))
                .toList(),
            // children: [
            //   Text("error"),
            //   Text("In this"),
            //   Text("Blocki"),
            //   Text("It should \n constant \n value \n but changing \n with the \n value")
            // ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (context, value, child) {
                if(value.menuType != MenuType.clock) return Container();

                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Clock",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: "avenir",
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 64,
                                  fontFamily: "avenir"),
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),

                      //ClockView.....................................
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                            alignment: Alignment.center,
                            child: ClockView(
                              size: MediaQuery.of(context).size.height / 4,
                            )),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Timezone",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "UTC$offsetSign$timezoneString",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: "avenir",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (context, value, child) {
        return SizedBox(
          height: 100,
          width: 70,
        
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 5, ),
            color: currentMenuInfo.menuType == value.menuType
                ? const Color.fromARGB(255, 72, 66, 65)
                : Colors.transparent,
            child: ElevatedButton(
              //   style: ButtonStyle(backgroundColor: currentMenuInfo.menuType == value.menuType
              // ? Colors.red : Colors.transparent,),

              onPressed: () {
                var menuInfo = Provider.of<MenuInfo>(context, listen: false);
                menuInfo.updateMenu(currentMenuInfo);
              },
              child: Column(
                children: <Widget>[
                  Image.asset(
                    currentMenuInfo.imageSource!,
                    scale: 1.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentMenuInfo.title!,
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
