import 'package:flutter/material.dart';

class DataController extends ChangeNotifier {
  static bool Morning = false;
  static bool Afternoon = false;
  static bool Night = false;
  List<Map<String, dynamic>> selectedItemsList = [];
  // List Schedule = [

  // ];

  List<Map<String, dynamic>> data = [
    {
      "Sunday": Shifts(),
      "isSelected": false,
    },
    {
      "Monday": Shifts(),
      "isSelected": false,
    },
    {
      "Tuesday": Shifts(),
      "isSelected": false,
    },
    {
      "Wednesday": Shifts(),
      "isSelected": false,
    },
    {
      "Thursday": Shifts(),
      "isSelected": false,
    },
    {
      "Friday": Shifts(),
      "isSelected": false,
    },
    {
      "Saturday": Shifts(),
      "isSelected": false,
    }
  ];
  updateDaySelection(int index) {
    data[index]["isSelected"] = !data[index]["isSelected"];

    if (data[index]["isSelected"] == true) {
      data[index][data[index].entries.first.key] =
          Shifts(morning: true, afternoon: true, night: true);
    } else {
      data[index][data[index].entries.first.key] = Shifts();
    }
    notifyListeners();
  }

  onShiftSelection(int index, Shifts shifts) {
    data[index][data[index].entries.first.key] = shifts;
    if (shifts.afternoon || shifts.morning || shifts.night) {
      data[index]["isSelected"] = true;
    } else {
      data[index]["isSelected"] = false;
    }
    notifyListeners();
  }

  getSelectedItems() {
    selectedItemsList =
        data.where((element) => element["isSelected"] == true).toList();
    print(selectedItemsList.length);

    notifyListeners();
  }
}

class Shifts {
  bool morning;
  bool afternoon;
  bool night;

  Shifts({this.morning = false, this.afternoon = false, this.night = false});
}
