import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:workmanager/workmanager.dart';

void _callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    FlutterLocalNotificationsPlugin flip =
        new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = new IOSInitializationSettings();
    var settings = new InitializationSettings(android: android, iOS: ios);
    flip.initialize(settings);
    _showNotificationWithDefaultSound(flip);
    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(flip) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
    '0',
    'aíma',
    importance: Importance.max,
    priority: Priority.high,
  );
  var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
  var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flip.show(0, 'Olá,', 'Vamos iniciar o seu primeiro registro? ;)',
      platformChannelSpecifics,
      payload: 'Default_Sound');
}

initNotification() {
  Workmanager().initialize(_callbackDispatcher, isInDebugMode: false);
  // Workmanager().registerOneOffTask(
  //   '0',
  //   'Olá,',
  // );
  // Workmanager().registerPeriodicTask(
  //   "0",
  //   "Como você está se sentindo hoje?",
  //   frequency: Duration(minutes: 15),
  // );
}
