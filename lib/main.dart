import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';
import 'package:mvvm/utils/routes.dart';
import 'package:mvvm/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: cyan),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Routes.push(context, const Other());
          },
          child: const Text("Navigate"),
        ),
      ),
    );
  }
}

class Other extends StatefulWidget {
  const Other({super.key});

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Utils.showMassage(context, "hello");
          },
          child: const Text("Navigate"),
        ),
      ),
    );
  }
}
