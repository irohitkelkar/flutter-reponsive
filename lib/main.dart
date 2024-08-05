import 'package:flutter/material.dart';
import 'package:flutter_poc/account.dart';
import 'package:flutter_poc/chat.dart';
import 'package:flutter_poc/homepage.dart';
import 'package:flutter_poc/registration_screen.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Responsive Tab Layout'),
              ),
              body: child,
              bottomNavigationBar: _shouldShowBottomNavBar(state.location)
                  ? BottomNavigationBar(
                      currentIndex: _calculateSelectedIndex(state.location),
                      onTap: (index) {
                        switch (index) {
                          case 0:
                            GoRouter.of(context).go('/homepage');
                            break;
                          case 1:
                            GoRouter.of(context).go('/account');

                            break;
                          case 2:
                            GoRouter.of(context).go('/chat');
                            break;
                        }
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle), label: 'Account'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.chat), label: 'Chat'),
                      ],
                    )
                  : null,
            );
          },
          routes: [
            GoRoute(
                path: '/',
                builder: (context, state) => const RegistrationScreen()),
            GoRoute(path: '/homepage', builder: (context, state) => Homepage()),
            GoRoute(
                path: '/account', builder: (context, state) => AccountPage()),
            GoRoute(
                path: '/chat', builder: (context, state) => const ChatPage()),
          ],
        ),
      ],
    );
  }

  bool _shouldShowBottomNavBar(String location) {
    return location != '/';
  }

  int _calculateSelectedIndex(String location) {
    if (location.startsWith('/homepage')) return 0;
    if (location.startsWith('/account')) return 1;
    if (location.startsWith('/chat')) return 2;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Responsive App POC',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          labelStyle: const TextStyle(color: Colors.blue),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor:
              Colors.white, // Background color of the BottomNavigationBar
          selectedItemColor: Colors.blueAccent, // Color of the selected item
          unselectedItemColor: Colors.grey, // Color of the unselected items
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold, // Make selected item label bold
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight:
                FontWeight.normal, // Normal weight for unselected item labels
          ),
          type: BottomNavigationBarType
              .fixed, // Fixed layout for the BottomNavigationBar
          elevation: 8, // Elevation for shadow effect
          showUnselectedLabels: true, // Show labels for unselected items
          showSelectedLabels: true, // Show labels for selected items
          landscapeLayout: BottomNavigationBarLandscapeLayout
              .linear, // Layout in landscape mode
        ),
      ),
    );
  }
}
