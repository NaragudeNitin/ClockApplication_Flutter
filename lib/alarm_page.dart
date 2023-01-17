import 'package:clock_application_flutter/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:clock_application_flutter/theme_data.dart';
import 'package:intl/intl.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarms',
            style: TextStyle(
              fontFamily: 'avenir',
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: alarm.gradientColors,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: alarm.gradientColors.last.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: const Offset(4, 4),
                      )
                    ],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.label,
                                color: Colors.white,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Office",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'avenir',
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          // Switch(
                          //   value: true,
                          //   onChanged: (value) {},
                          //   activeColor: Colors.white,
                          // ),
                        ],
                      ),
                      const Text(
                        "mon-fri",
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'avenir', fontSize: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "07:00 AM",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockOutline,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  dashPattern: [5,4],
                  child: Container(
                    width: double.infinity,
                    // color: CustomColors.clockBG,
                    decoration:  BoxDecoration(
                      color: CustomColors.clockBG,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                    ),
                    
                    child: TextButton(                      
                        onPressed: () {},
                        child: Column(
                          children: const [
                            Icon(Icons.add_alarm),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Add Alarm',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'avenir'),
                            )
                          ],
                        ),),
                  ),
                )
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
