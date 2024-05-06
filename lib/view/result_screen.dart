import 'package:flutter/material.dart';
import 'package:grapes_inov_test/controller/screen_controller.dart';
import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DataController>().getSelectedItems();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[200],
        title: const Text(
          "Selected working time",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<DataController>(
        builder: (context, controller, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(
                  children: [
                    TableRow(children: [
                      TableCard(size: size, text: "Day"),
                      TableCard(size: size, text: "Shift"),
                    ]),
                    ...List.generate(controller.selectedItemsList.length,
                        (index) {
                      Shifts element = controller.selectedItemsList[index]
                          [controller.selectedItemsList[index].entries.first.key];
                      return TableRow(children: [
                        TableCard(
                            size: size,
                            text: controller.selectedItemsList
                                .elementAt(index)
                                .entries
                                .first
                                .key),
                        TableCard(
                            size: size,
                            text: generateMessage(
                                morning: element.morning,
                                afternoon: element.afternoon,
                                night: element.night))
                      ]);
                    })
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}

String generateMessage(
    {bool morning = false, bool afternoon = false, bool night = false}) {
  List<String> parts = [];

  if (morning) {
    parts.add("Morning");
  }
  if (afternoon) {
    if (parts.isNotEmpty) {
      parts.add(",");
    }
    parts.add("Afternoon");
  }
  if (night) {
    if (parts.isNotEmpty) {
      parts.add(",");
    }
    parts.add("Night");
  }

  return parts.join();
}

class TableCard extends StatelessWidget {
  TableCard({
    super.key,
    required this.size,
    required this.text,
  });
  final String text;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .4,
      decoration: BoxDecoration(border: Border.all(), color: Colors.white),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black),
      ),
    );
  }
}
