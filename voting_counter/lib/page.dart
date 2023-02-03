import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voting_counter/number_widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  DateTime countDate = DateTime.parse('2023-05-14 08:00');
  // DateTime countDate = DateTime.parse('2023-02-03 23:05');
  DateTime closeDate = DateTime.parse('2023-05-14 18:00');

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(80.0).copyWith(bottom: 0, top: 0),
        child: CountdownTimer(
          endTime: countDate.millisecondsSinceEpoch + 1000 * 30,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return CountdownTimer(
                endTime: closeDate.millisecondsSinceEpoch + 1000 * 30,
                widgetBuilder: (_, CurrentRemainingTime? secondtime) {
                  if (secondtime == null) {
                    return Text(
                      'Sandıkların Kapanmasına',
                      style: GoogleFonts.poppins(fontSize: 160, fontWeight: FontWeight.bold, color: Colors.green),
                    );
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sandıkların kapanmasına",
                        style: GoogleFonts.poppins(fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        color: const Color(0xfff99819),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (secondtime.hours ?? 0) > 0
                                ? NumberWidget(text: 'SAAT', count: secondtime.hours ?? 0)
                                : const SizedBox(),
                            (secondtime.min ?? 0) > 0
                                ? NumberWidget(text: 'DAKİKA', count: secondtime.min ?? 0)
                                : const SizedBox(),
                            NumberWidget(text: 'SANİYE', count: secondtime.sec ?? 0),
                          ],
                        ),
                      )
                    ],
                  );
                },
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Yüzyılın Seçimine",
                  style: GoogleFonts.poppins(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff017bc2),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  color: const Color(0xfff99819),
                  child: (time.days ?? 0) > 0 ? NumberWidget(text: 'GÜN', count: time.days ?? 0) : const SizedBox(),
                ),
                const SizedBox(
                  height: 1,
                ),
                Container(
                  color: const Color(0xff017bc2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (time.hours ?? 0) > 0
                          ? NumberWidget(
                              text: 'SAAT',
                              count: time.hours ?? 0,
                              dot: true,
                            )
                          : const SizedBox(),
                      (time.min ?? 0) > 0
                          ? NumberWidget(
                              text: 'DAKİKA',
                              count: time.min ?? 0,
                              dot: true,
                            )
                          : const SizedBox(),
                      NumberWidget(text: 'SANİYE', count: time.sec ?? 0),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Image.asset("assets/logo.jpg"),
              ],
            );
          },
        ),
      ),
    );
  }
}
