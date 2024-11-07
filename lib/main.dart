import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technical_round/Routes/route_name.dart';
import 'package:technical_round/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true, fontFamily: 'Merriweather'),
      onGenerateRoute: AppRouting.generateRoute,
      initialRoute: RouteName.splash,
    );
  }
}
