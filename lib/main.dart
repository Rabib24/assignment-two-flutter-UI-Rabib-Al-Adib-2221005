import 'package:flutter/material.dart';

// core
import 'core/theme/app_colors.dart';
import 'core/widgets/app_scaffold.dart';

// features
import 'features/home/home_page.dart';
import 'features/reports/reports_page.dart';
import 'features/cards/cards_page.dart';
import 'features/profile/profile_page.dart';

void main() {
  runApp(const StudentBankApp());
}

class StudentBankApp extends StatelessWidget {
  const StudentBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Bank',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto',
      ),
      home: const RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    ReportsPage(),
    CardsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: _currentIndex,
      onTabSelected: (index) {
        setState(() => _currentIndex = index);
      },
      body: _pages[_currentIndex],
    );
  }
}
