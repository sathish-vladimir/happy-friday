import 'package:flutter/material.dart';
import 'core/widgets/app_bottom_nav_bar.dart';
import 'feature/home/presentation/view/home_screen.dart';
import 'feature/my_albums/presentation/view/my_albums_screen.dart';
import 'feature/playlist/presentation/view/play_list_screen.dart';
import 'feature/profile/presentation/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    MyAlbumsScreen(),
    PlayList(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
