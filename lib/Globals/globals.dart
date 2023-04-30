import 'package:flutter/material.dart';

class Globals {
  static int stepIndex = 0;
  static List<GlobalKey<FormState>> formKey =
      List.generate(3, (index) => GlobalKey<FormState>());
  static DateTime? selectedDate;
  static String date = "00/00/0000";
}
