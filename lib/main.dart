import 'package:flutter/material.dart';
import 'package:setel_mobile/pages/feedback_page.dart';
import 'package:setel_mobile/pages/history_page.dart';
import 'package:setel_mobile/pages/home_page.dart';
import 'package:setel_mobile/pages/info_shelter_page.dart';
import 'package:setel_mobile/pages/login_page.dart';
import 'package:setel_mobile/pages/scan_qr_page.dart';
import 'package:setel_mobile/pages/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      title: 'Setel Mobile App',
      theme: ThemeData(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 163, 41, 41)),
        useMaterial3: true,
      ),
      routes: {
        '/home': (context) => HomePage(name: 'Jannatin'),
        '/': (context) => LoginPage(),
        '/scan-qr': (context) => ScanPage(),
        '/history': (context) => HistoryPage(),
        '/profile': (context) => ProfilePage(),
        '/feedback': (context) => FeedbackForm(),
        '/info': (context) => InfoShelterPage()
      },
    );
  }
}
