import 'package:flutter/material.dart';
import 'package:proprty_managment/icons.dart';
import 'package:proprty_managment/widgets/communication.dart';
import 'package:proprty_managment/widgets/maintance.dart';
import 'package:proprty_managment/widgets/my_information/my_info.dart';
import 'package:proprty_managment/widgets/rentals.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const MyInfo(),
    const CommunicationWidget(),
    const MaintenanceWidget(),
    const Rentals(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: SizedBox(
              height: 85,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color(0xFF2E577F),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey[400],
                selectedLabelStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                // Set font size for selected items
                unselectedLabelStyle: const TextStyle(fontSize: 10),
                // Set font size for unselected items
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Image.asset(AppIcons.dashBoard,
                        color: const Color(0xFFCEDCE7)),
                    label: 'Dashboard',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppIcons.communication,
                        color: const Color(0xFFA2BF81)),
                    label: 'Communication',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppIcons.maintantice,
                        color: const Color(0xFFF9C6B4)),
                    label: 'Maintenance',
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(AppIcons.rentalsImage,
                        color: const Color(0xFFFFE080)),
                    label: 'Rentals',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
            )));
  }
}
