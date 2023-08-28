import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get1/controller/counter.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("GET X")),
      body: Column(children: [Center(
        child: Obx((){
          return Center(child: Text(controller.counter.toString(),style: TextStyle(fontSize: 50),));
        }
        ),
      )]),
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
  onPressed: (){
    controller.incrementcontroller();
  },
),
    );
  }
}
