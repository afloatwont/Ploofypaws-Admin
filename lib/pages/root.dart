import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ploofypaws_doctor/pages/appointment_page.dart';
import 'package:ploofypaws_doctor/pages/menu_page.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const AppointmentPage(),
    const AppointmentPage(),
    const MenuPage(),
    const MenuPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Appointments',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Colors.black,
            ),
          ],
          currentIndex: _currentIndex, // Set the current index
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
