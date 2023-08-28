import 'package:firebase_messaging/firebase_messaging.dart';
Future<void> handleBackgroundMessage(RemoteMessage message)async {
print('Title: ${message.notification?.title}');
print('body: ${message.notification?.body}');
print('payload: ${message.data}');

}

class FirebaseApi{
  final _firebasemessaging =FirebaseMessaging.instance;

  Future<void>initNotification()async{
    await _firebasemessaging.requestPermission();
    final fCMToken=await _firebasemessaging.getToken();
    print('TOKEN: $fCMToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}