import 'package:codigo5_provider/pages/home_page.dart';
import 'package:codigo5_provider/providers/api_provider.dart';
import 'package:codigo5_provider/providers/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => CounterProvider()),
        ChangeNotifierProvider(create: (BuildContext context) => ApiProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
