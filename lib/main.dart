import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proprty_managment/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
         Container(

         )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.go('/bottom_navigation');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
