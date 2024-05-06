import 'package:flutter/material.dart';
import 'package:grapes_inov_test/controller/screen_controller.dart';
import 'package:provider/provider.dart';

import 'tile_button.dart';

class TileList extends StatelessWidget {
  TileList(
      {super.key,
      required this.days,
      required this.shifts,
      required this.index});
  final String days;

  final Shifts shifts;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataController>(
      builder: (_, controller, __) => Container(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 16),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(color: Colors.white.withOpacity(.8)),
        child: Row(children: [
          Row(
            children: [
              Checkbox(
                value: controller.data[index]["isSelected"],
                onChanged: (value) {
                  controller.updateDaySelection(index);
                },
              ),
              SizedBox(width: 2),
              Text(
                days,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              GestureDetector(
                  onTap: () {
                    controller.onShiftSelection(
                        index,
                        Shifts(
                          morning: !shifts.morning,
                          afternoon: shifts.afternoon,
                          night: shifts.night,
                        ));
                  },
                  child: TileButton(
                    text: "Morning",
                    buttonColor: shifts.morning ? Colors.blue : Colors.white,
                  )),
              SizedBox(width: 8),
              GestureDetector(
                  onTap: () {
                    controller.onShiftSelection(
                        index,
                        Shifts(
                          morning: shifts.morning,
                          afternoon: !shifts.afternoon,
                          night: shifts.night,
                        ));
                  },
                  child: TileButton(
                    text: "Afternoon",
                    buttonColor: shifts.afternoon ? Colors.blue : Colors.white,
                  )),
              SizedBox(width: 8),
              GestureDetector(
                  onTap: () {
                    controller.onShiftSelection(
                        index,
                        Shifts(
                          morning: shifts.morning,
                          afternoon: shifts.afternoon,
                          night: !shifts.night,
                        ));
                  },
                  child: TileButton(
                    text: "night",
                    buttonColor: shifts.night ? Colors.blue : Colors.white,
                  )),
            ],
          ),
        ]),
      ),
    );
  }
}
