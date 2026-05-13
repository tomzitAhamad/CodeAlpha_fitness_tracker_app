import 'package:flutter/material.dart';

import 'analytics_page.dart';
import 'dashboard_page.dart';
import 'history_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int currentIndex = 0;

  final pages = const [DashboardPage(), HistoryPage(), AnalyticsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),

          NavigationDestination(icon: Icon(Icons.history), label: "History"),

          NavigationDestination(
            icon: Icon(Icons.bar_chart),
            label: "Analytics",
          ),
        ],
      ),
    );
  }
}
