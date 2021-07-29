import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _firebaseApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong!\n${snapshot.error}');
            } else if (snapshot.hasData) {
              return MyHomePage(title: 'Controller');
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DatabaseReference _w = FirebaseDatabase.instance.reference().child("W");
  DatabaseReference _a = FirebaseDatabase.instance.reference().child("A");
  DatabaseReference _s = FirebaseDatabase.instance.reference().child("S");
  DatabaseReference _d = FirebaseDatabase.instance.reference().child("D");
  DatabaseReference _lc = FirebaseDatabase.instance.reference().child("LC");
  DatabaseReference _rc = FirebaseDatabase.instance.reference().child("RC");
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            title: Text(widget.title),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _w.set(1);
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _w.set(0);
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.fromLTRB(65, 0, 0, 0),
                      height: 75,
                      width: 75,
                      child: IconButton(
                        icon: Image.asset('assets/images/up.jpg'),
                        onPressed: () {
                          print("ButtonState: Up");
                        },
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 550,
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _rc.set(1);
                      });
                    },
                    onTapCancel: () {
                      _rc.set(0);
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      child: IconButton(
                        icon: Image.asset('assets/images/Button.jpg'),
                        onPressed: () {
                          print("ButtonState: Button2");
                        },
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _a.set(1);
                      });
                    },
                    onTapCancel: () {
                      _a.set(0);
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      child: IconButton(
                        icon: Image.asset('assets/images/left.jpg'),
                        onPressed: () {
                          print("ButtonState: Left");
                        },
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _d.set(1);
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _d.set(0);
                      });
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      child: IconButton(
                        icon: Image.asset('assets/images/right.jpg'),
                        onPressed: () {
                          print("ButtonState: Right");
                        },
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 350,
                  ),
                  GestureDetector(
                    onTapDown: (details) {
                      setState(() {
                        _lc.set(1);
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        _lc.set(0);
                      });
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      child: IconButton(
                        icon: Image.asset('assets/images/Button.jpg'),
                        onPressed: () {
                          print("ButtonState: Button1");
                        },
                        splashColor: Colors.white,
                        highlightColor: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              GestureDetector(
                onTapDown: (details) {
                  setState(() {
                    _s.set(1);
                  });
                },
                onTapCancel: () {
                  _s.set(0);
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(65, 0, 0, 0),
                  height: 75,
                  width: 75,
                  child: IconButton(
                    icon: Image.asset('assets/images/down.jpg'),
                    onPressed: () {
                      print("ButtonState: Down");
                    },
                    splashColor: Colors.white,
                    highlightColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
