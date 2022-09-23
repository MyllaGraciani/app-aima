import 'package:aima/config/notifications.dart';
import 'package:aima/ui/pages/my_app.page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initNotification();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}
