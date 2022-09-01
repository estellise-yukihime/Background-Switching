import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swtiching_background/home/homepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nanika',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: const HomePage(),
    );
  } 
}