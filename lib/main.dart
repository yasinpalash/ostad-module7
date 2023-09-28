import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.teal,
          appBarTheme: AppBarTheme(color: Colors.teal)),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swithch And Alret'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Switch(value: true, onChanged: (bool value) {}),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Alert'),
                        content: Text('You are in Danger'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'))
                        ],
                      );
                    });
              },
              child: Text("ALert Box")),
          ElevatedButton(
              onPressed: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Yasin',
                    applicationVersion: '0.1',
                    applicationIcon: Icon(Icons.accessibility_sharp),
                    children: [Text('this is Yasin')]);
              },
              child: const Text('Show About')),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    isDismissible: false,
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    context: context,
                    builder: (context) {
                      return Column(
                        children: [Text('Yasin Mia Palash')],
                      );
                    });
              },
              child: Text('This is bottom sheet'))
        ],
      ),
    );
  }
}
