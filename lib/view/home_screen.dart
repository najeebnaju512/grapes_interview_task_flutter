import 'package:flutter/material.dart';
import 'package:grapes_inov_test/controller/screen_controller.dart';
import 'package:grapes_inov_test/view/result_screen.dart';
import 'package:grapes_inov_test/view/widget/tile_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.tealAccent[200],
        title: const Text(
          "Schedule working time",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Day",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                SizedBox(
                  width: size.width * .3,
                ),
                const Text("Shift",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.black))
              ],
            ),
          ),
          Consumer<DataController>(
            builder: (context, dControl, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dControl.data.length,
                itemBuilder: (context, index) {
                  return TileList(
                      index: index,
                      days: dControl.data[index].entries.first.key,
                      shifts: dControl.data[index].entries.first.value);
                },
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.tealAccent[200],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ResultScreen()));
        },
        label:  Center(child: Text("Schedule")),
      ),
    ));
  }
}
