import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/tabs.dart';

final theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color.fromARGB(255, 196, 96, 96),
  primaryColor: Color.fromARGB(252, 26, 207, 10),
  canvasColor: Color.fromARGB(255, 30, 199, 221),
  textTheme: GoogleFonts.fasthandTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(126, 238, 219, 132),
        textTheme: GoogleFonts.fasthandTextTheme(),
      ),
      home: const TabsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
