import 'package:flutter/material.dart';
import 'package:flutter_poc/features/account/account.dart';
import 'package:flutter_poc/features/chat/chat.dart';
import 'package:flutter_poc/features/account/registration_screen.dart';
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
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const RegistrationScreen(),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Traders App'),
                centerTitle: true,
              ),
              body: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: const [
                  ChatPage(),
                  AccountPage(),
                ],
              ),
              bottomNavigationBar: _shouldShowBottomNavBar(state.location)
                  ? BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.chat), label: 'Chat'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.account_circle), label: 'Account'),
                      ],
                    )
                  : null,
            );
          },
          routes: [
            GoRoute(
              path: '/account',
              builder: (context, state) => const AccountPage(),
            ),
            GoRoute(
              path: '/chat',
              builder: (context, state) => const ChatPage(),
            ),
          ],
        ),
      ],
    );
  }

  bool _shouldShowBottomNavBar(String location) {
    return location != '/';
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
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
                const Color.fromARGB(255, 1, 139, 251)),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)),
            textStyle: WidgetStateProperty.all<TextStyle>(
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
