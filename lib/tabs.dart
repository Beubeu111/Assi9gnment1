import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/pages/expense.dart';
import 'package:mobile_app_assignment/pages/reports.dart';
import 'package:mobile_app_assignment/pages/settings.dart';
import 'package:mobile_app_assignment/types/widgets.dart';

class TabsController extends StatefulWidget{
  const TabsController({super.key});

  @override
  State<TabsController> createState() => _TabsControllerState();
}


class _TabsControllerState extends State<TabsController>{
  var _selectedIndex = 0;

  static const List<WidgetWithTitle> _pages = [
    Expenses(),
    Statistic(),
    Settings()
  ];

  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedIndex].title),
        ),
        backgroundColor: Colors.white,
        body: _pages[_selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              label: 'Statistics',
            ),


            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white
        ),
      ),
    );
  }
}