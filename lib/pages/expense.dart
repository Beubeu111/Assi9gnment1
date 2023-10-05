import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/types/widgets.dart';

class Expenses extends WidgetWithTitle{
    const Expenses ({super.key}) : super(title: "Expenses");

  @override
  Widget build(BuildContext context) {
    return const Text("Expenses!");
  }
}