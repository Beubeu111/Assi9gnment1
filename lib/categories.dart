// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class Categories extends StatefulWidget{
  const Categories({super.key});
  @override
  _CategoriesState createState () => _CategoriesState();
}

class _CategoriesState extends State<Categories>{
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(
          color: Colors.white,
        ),
        middle: Text("Categories"),
        backgroundColor: Colors.blue,
      ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          transformAlignment: Alignment.center,
          child: Column(
              children: [
                Expanded(
                    child:                 CupertinoFormSection.insetGrouped(
                        children: [
                          ...List.generate(
                              5,
                                  (index) => GestureDetector(

                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(),
                                    child: CupertinoFormRow(
                                      prefix: Row(
                                        children: [

                                          Container(
                                            width: 10,
                                            height: 10,
                                            margin: const EdgeInsets.all(5),
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: pickerColor,
                                                shape: BoxShape.circle,

                                            ),
                                          ),
                                          const Text("Category name"),
                                        ],
                                      ),
                                      helper: null,
                                      padding: const EdgeInsets.all(16),
                                      child: Container(),
                                    ),
                                  )))
                        ]
                    ) ),
                SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Pick a category color!'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: pickerColor,
                                    onColorChanged: changeColor,
                                  ),
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    child: const Text('Get'),
                                    onPressed: () {
                                      setState(() => currentColor = pickerColor);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: pickerColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 3, strokeAlign: BorderSide.strokeAlignOutside)
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(right: 12),
                          child: CupertinoTextField(
                          placeholder: "Category name",
                          controller: _textController,
                          ),
                        )
                        ),
                        const Text("B"),
                      ],
                    ),
                  ),
                )
    ]),
        ));
  }
}