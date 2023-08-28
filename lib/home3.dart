import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'notification.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

class HOme3 extends StatefulWidget {
  const HOme3({super.key});

  @override
  State<HOme3> createState() => _HOme3State();
}

class _HOme3State extends State<HOme3> {
  notification notificationsServices =notification();
  var _timepicker=TimeOfDay.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationsServices.initialiseNotification();

  }
  void time(){
    showTimePicker(context: context, initialTime:TimeOfDay.now())
        .then((value){
      setState(() {
        _timepicker=value!;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(width: double.infinity,height: double.infinity,
      child: Column(children: [
        ElevatedButton(onPressed: (){
          notificationsServices.sendNotification("vyas ji", 'hi');
        }, child: Text("send notification"))
,
        ElevatedButton(onPressed: (){
          notificationsServices.scheduleNotification("vyas ji", 'yash');
        }, child: Text("schedule notification"))
,

        ElevatedButton(onPressed: (){
         notificationsServices.canelnotifications();
        }, child: Text("stop notification"))
      ,

      ElevatedButton(onPressed: (){
        time();
      }, child: Text("time")),
      Text(_timepicker.format(context).toString(),style: TextStyle(fontSize: 20),),
        ElevatedButton(onPressed: (){
          notificationsServices.qwe(title: "vyas ji", body: 'yash',timepicker:_timepicker  );
        }, child: Text("schedule notification"))
        ,
      TextButton(
          onPressed: () {
            DatePicker.showDatePicker(context,
                showTitleActions: true,
                minTime: DateTime(1900),
                maxTime: DateTime(2200), onChanged: (date) {
                  print('change $date');
                }, onConfirm: (date) {
                  print('confirm $date');
                }, currentTime: DateTime.now(), locale: LocaleType.en);
          },
          child: Text(
            'show date time picker (INDIA)',
            style: TextStyle(color: Colors.blue),
          )),
        ElevatedButton(onPressed: (){}, child:Text("firebase"))
      ],)),
    );
  }
}

