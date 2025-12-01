import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import "student_app_bar.dart";

class AppScaffold extends StatelessWidget {
  final String studentName = "Rabib Al Adib"; 

  final int currentIndex;
  final ValueChanged<int> onTabSelected;
  final Widget body;

  const AppScaffold({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentAppBar(studentName: studentName),
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        onTap: onTabSelected,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Cards',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
