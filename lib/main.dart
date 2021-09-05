import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
    ),
  );
}

// UI Design

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int value = 0;
String check = 'times';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('I\'m Being Good'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/Deer-forest.jpg'),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.black,
                    child: Text(
                      'I\'ve helped the world $value $check today',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        value++;
                        if (value == 1) {
                          check = 'time';
                        } else {
                          check = 'times';
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                    child: Icon(Icons.autorenew),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "A New Day",
                        desc: "Let's make a fresh start:-) Try to be even better than yesterday!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "Let's Go!!!",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => Navigator.pop(context),
                            width: 120,
                          )
                        ],
                      ).show();
                      setState(() {
                        value = 0;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
