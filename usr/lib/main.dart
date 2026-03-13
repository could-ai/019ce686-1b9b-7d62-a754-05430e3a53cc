import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/find_court_screen.dart';
import 'screens/matchmaking_screen.dart';
import 'screens/profile_screen.dart';
import 'providers/app_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MaterialApp(
        title: 'Pickleball Connect',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF4CAF50), // Pickleball Green
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'SF Pro',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontFamily: 'SF Pro',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF4CAF50),
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: 'SF Pro',
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4CAF50),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              textStyle: const TextStyle(
                fontFamily: 'SF Pro',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          cardTheme: CardTheme(
            color: Colors.white,
            shadowColor: Colors.black.withOpacity(0.1),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            headlineMedium: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(
              fontFamily: 'SF Pro',
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontFamily: 'SF Pro',
              color: Colors.black,
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/find-court': (context) => const FindCourtScreen(),
          '/matchmaking': (context) => const MatchmakingScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    FindCourtScreen(),
    MatchmakingScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Find Court',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_baseball),
            label: 'Matchmaking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}