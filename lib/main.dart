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
      title: 'Flutter Demo',
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
  DatabaseReference _W = FirebaseDatabase.instance.reference().child("W");
  DatabaseReference _A = FirebaseDatabase.instance.reference().child("A");
  DatabaseReference _S = FirebaseDatabase.instance.reference().child("S");
  DatabaseReference _D = FirebaseDatabase.instance.reference().child("D");
  DatabaseReference _LC = FirebaseDatabase.instance.reference().child("LC");
  DatabaseReference _RC = FirebaseDatabase.instance.reference().child("RC");
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
                  Container(
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
                  SizedBox(
                    width: 550,
                  ),
                  Container(
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
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
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
                  SizedBox(
                    width: 50,
                  ),
                  Container(
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
                  SizedBox(
                    width: 350,
                  ),
                  Container(
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
                  )
                ],
              ),
              Container(
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
              )
            ],
          ),
        ));
  }
}
