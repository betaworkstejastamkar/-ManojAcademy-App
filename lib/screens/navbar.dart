import 'package:flutter/material.dart';
import 'package:manojacademy/screens/home.dart';
import 'package:manojacademy/screens/livelecturespage.dart';
import 'package:manojacademy/screens/searchpage.dart';
import 'package:manojacademy/screens/testpage.dart';
import 'package:manojacademy/widgets/drawer.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  String appBarTitle = 'Home';
  final screens = [
    const Home(),
    const SearchPage(),
    const LivelecturesPage(),
    const TestPage(),
  ];

  changeAppBarTitle({required int inDexNumber}) {
    switch (inDexNumber) {
      case 0:
        appBarTitle = 'Home';
        break;
      case 1:
        appBarTitle = 'Search';
        break;
      case 2:
        appBarTitle = 'Live';
        break;
      default:
        appBarTitle = 'Test';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Class 6'),
        centerTitle: true,
      ),
      drawer: const SideBar(),
      backgroundColor: Colors.white,
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_camera_front_rounded,
              size: 30,
            ),
            label: 'Live',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.border_all_rounded,
              size: 30,
            ),
            label: 'Test',
          ),
        ],
        selectedFontSize: 20,
        unselectedFontSize: 20,
        selectedLabelStyle: const TextStyle(fontSize: 0),
        unselectedLabelStyle: const TextStyle(fontSize: 0),
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: const Color.fromRGBO(165, 153, 153, 1),
        onTap: (index) => {
          setState(() {
            _selectedIndex = index;
          }),
          changeAppBarTitle(inDexNumber: _selectedIndex)
        },
      ),
    );
  }
}
