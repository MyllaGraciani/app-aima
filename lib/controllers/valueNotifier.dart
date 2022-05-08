import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

ValueNotifier<String> dataAtual =
    ValueNotifier<String>(DateFormat('dd/MM/yyyy').format(DateTime.now()));
