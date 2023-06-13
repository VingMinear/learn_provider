import 'package:flutter/material.dart';
import 'package:learn_provider/config/provider.dart';
import 'package:learn_provider/src/view/home_screen.dart';
import 'package:learn_provider/utils/dismiss_keyboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider().provider,
      child: const DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
