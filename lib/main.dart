import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/home_page.dart';
import 'controllers/postos_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider<PostosController>(
      create: (context) => PostosController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(useMaterial3: true,),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

