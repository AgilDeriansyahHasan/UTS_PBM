import 'package:flutter/material.dart';
import 'pages/halaman_utama.dart';
import 'pages/halaman_jadwal.dart';
import 'pages/halaman_profile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelompok 5 App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF000000), // Hitam pekat
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4AF37), // Emas antik
          secondary: Color(0xFF2F4F4F), // Abu-abu besi
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFFF5F5F5),
          ),
          bodyMedium: TextStyle(
            color: Color(0xFFF5F5F5),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Color(0xFFD4AF37)),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HalamanUtama(),
    HalamanJadwal(),
    HalamanProfile(),
  ];

  final List<String> _titles = [
    'Beranda',
    'Jadwal',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: isWideScreen ? _buildTabletLayout() : _buildMobileLayout(),
      bottomNavigationBar: isWideScreen ? null : _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          labelType: NavigationRailLabelType.all,
          backgroundColor: const Color(0xFF1E1E1E),
          selectedIconTheme: const IconThemeData(color: Color(0xFFD4AF37)),
          selectedLabelTextStyle: const TextStyle(color: Color(0xFFD4AF37)),
          unselectedIconTheme: IconThemeData(color: Colors.grey[600]),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text('Utama'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.auto_stories_outlined),
              selectedIcon: Icon(Icons.auto_stories),
              label: Text('Jadwal'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.person_outline),
              selectedIcon: Icon(Icons.person),
              label: Text('Profil'),
            ),
          ],
        ),
        const VerticalDivider(width: 1),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: KeyedSubtree(
              key: ValueKey(_currentIndex),
              child: _pages[_currentIndex],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: KeyedSubtree(
        key: ValueKey(_currentIndex),
        child: _pages[_currentIndex],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      selectedItemColor: const Color(0xFFD4AF37),
      unselectedItemColor: Colors.grey[600],
      backgroundColor: const Color(0xFF1E1E1E),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Utama',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Jadwal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
    );
  }
}
