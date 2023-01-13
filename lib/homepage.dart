import 'package:clock_application_flutter/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    print(timezoneString);

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("sdjasjjadnjnj")
              /*  buildMenuButton("Clock", "assets/clockpngimage.png"),
              buildMenuButton("Alarm", "assets/alarmpngimage.png"),
              buildMenuButton("Stopwatch", "assets/timerpngicon.png"),
              buildMenuButton("Timer", "assets/stopwatchpngicon.png"), */
            ],
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
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
                        fontWeight: FontWeight.w700
                        ),
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
                              fontWeight: FontWeight.w300
                              ),
                        ),
                      ],
                    ),
                  ),

                  //ClockView.....................................
                   Flexible(
                      flex: 4, fit: FlexFit.tight, 
                      child: Align(
                        alignment: Alignment.center,
                        child: ClockView(size: MediaQuery.of(context).size.height /4,)
                        ),),
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
                            fontWeight: FontWeight.w500
                          ),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(String title, String image) {
    return Container( 
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
      color: title == 'Clock' ? Colors.red: Colors.transparent,
      child: TextButton(
        
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              scale: 1.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, 
                  fontSize: 14, 
                  fontFamily: 'avenir'),
            ),
          ],
        ),
      ),
    );
  }
}


            /* Icon(
              Icons.alarm,
              color: Colors.white,
            ),
            // Image.asset('assets/alarmpngimage.png'),
            Text(
              "Alarm",
              style: TextStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.punch_clock,
              color: Colors.white,
            ),
            // Image.asset('assets/stopwatchpngicon.png'),
            Text(
              "Stopwatch",
              style: TextStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.timer,
              color: Colors.white,
            ),
            // Image.asset('assets/timerpngicon.png'),
            Text(
              "Timer",
              style: TextStyle(),
            ),
            SizedBox(
              height: 10,
            ), */