import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/database.dart';
import 'package:quiz_app/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final gorouter=goRouter();
    return ChangeNotifierProvider(
      create: (gorouter)=> FinalResult(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: gorouter,
      ),
    );
  }
}
