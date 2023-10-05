import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/categories.dart';
import 'package:mobile_app_assignment/currency.dart';
import 'package:mobile_app_assignment/types/widgets.dart';

class Item{
  final String label;
  final bool isDesructive;

  const Item(this.label, this.isDesructive);
}

const items= [
  Item('Currency Symbol', false),
  Item('Default Category', false),
  Item('Erase all Data', true),
];

class Settings extends WidgetWithTitle{
  const Settings({super.key}) : super(title: "Settings");



  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
      height: 180,
      transformAlignment: Alignment.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(16)
          ),
            child: CupertinoFormSection.insetGrouped(
            children: [
              ...List.generate(
                    items.length,
                    (index) => GestureDetector(
                  onTap: () {
                    switch (index){
                      case 0:
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context)=> const Currency()));
                        break;
                      case 1:
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context)=> const Categories()));
                        break;
                      case 2:
                        _showAlertDialog(context);
                    }
                  },
                  child: DecoratedBox(
                    decoration: const BoxDecoration(),
                    child: CupertinoFormRow(
                      prefix: Text(
                        items[index].label,
                        style: TextStyle(
                            color: items[index].isDesructive?
                            Colors.red: Colors.black),),
                      helper: null,
                      padding: const EdgeInsets.all(16),
                      child: items[index].isDesructive
                      ? Container()
                      :const Icon(Icons.keyboard_arrow_right)
                    ),
                  )))
            ])),
      );
  }
}


void _showAlertDialog(BuildContext context){
  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context)=> CupertinoAlertDialog(
        title: const Text("Are you sure?"),
        content: const Text("Items will be deleted permanently."),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No"),
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Yes"),
          ),
        ],
      ));
}