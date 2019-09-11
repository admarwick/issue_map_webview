import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

const CameraPosition _kInitialPosition =
    CameraPosition(target: LatLng(37.975075, -122.531806), zoom: 11.0);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Issue Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
      initialCameraPosition: _kInitialPosition,
      onMapCreated: (controller) {},
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 300.0,
              height: 300.0,
              child: googleMap,
            ),
            secondPageButton(context),
          ],
        ),
      ),
    );
  }

  Widget secondPageButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: const Text('Second Page'),
        onPressed: () {
          Navigator.of(context).push<void>(MaterialPageRoute<void>(
              builder: (BuildContext context) => SecondPage()));
        },
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  State createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              child: WebView(
                initialUrl: 'https://www.flutter.dev',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Please use the 'home' button, then"
                  " return to the app and use the back button."),
            ),
          ],
        ),
      ),
    );
  }
}
