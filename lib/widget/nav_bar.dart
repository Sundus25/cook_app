import 'package:cook_project/view/menu_page.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> pages = [
    MenuPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        shadowColor: Color(0xFF0000001A),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: Colors.white,
        animationDuration: const Duration(
          seconds: 4,
        ),
        indicatorColor: Color.fromARGB(255, 230, 230, 234),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home,
              color: Color(0xFFED9728),
            ),
            label: 'Menu',
            
            
          ),
          NavigationDestination(
            icon: Icon(
              Icons.account_circle_outlined,
              color: Color(0xFF979797),
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[selectedIndex],
    );
  }
}
