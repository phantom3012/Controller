import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Controller'),
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
                    width: 500,
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
