import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                counter.toString(),
                style: TextStyle(fontSize: 50),
              ),
            ),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileScreen(userName: 'Yasin')));

            }, child: Text('profile'))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counter = counter + 1;
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
//widget class
class ProfileScreen extends StatefulWidget {
  final String userName;
  const ProfileScreen({super.key, required this.userName});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

//state class->widget class
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      body: Center(
        child: Text(widget.userName),
      ),
    );
  }
}
