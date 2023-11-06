import 'package:flutter/material.dart';
import 'package:openweather/features/home/ui/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
        ),
      ),
      home: const HomePage(),
    );
  }
}
