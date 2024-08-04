import 'package:flutter/material.dart';

import '../src/features/discover/discover.dart';
import '../src/features/home/home.dart';
import '../src/features/notifications/notifications.dart';
import '../src/features/plates/plates.dart';
import '../src/features/profile/profile.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  final _pages = [
    const HomePage(),
    const DiscoverPage(),
    const PlatesPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        iconSize: 30,
        elevation: 3,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: '',
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
              icon: Icon(Icons.bubble_chart_outlined),
              label: 'Discover',
              activeIcon: Icon(Icons.bubble_chart)),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart_outline_outlined),
              label: 'Plates',
              activeIcon: Icon(Icons.pie_chart)),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notifications',
              activeIcon: Icon(Icons.notifications)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: '',
              activeIcon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
