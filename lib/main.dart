import 'package:flutter/material.dart';
import 'package:flutter_radio_player/flutter_radio_player.dart';
import 'package:flutter_radio_player/models/frp_source_modal.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio Player Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Audio Player Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url_radio = "https://station.voscast.com/4cfb5148c5760";


  int _counter = 0;
  final FlutterRadioPlayer _flutterRadioPlayer = FlutterRadioPlayer();
  late FRPSource frpSource; // Declare frpSource at the class level
  _MyHomePageState() {
    // Constructor
    _initializeRadioPlayer();
  }
  void _initializeRadioPlayer() {
    _flutterRadioPlayer.initPlayer();
    frpSource = FRPSource(
      mediaSources: <MediaSources>[
        MediaSources(
          url: "https://station.voscast.com/4cfb5148c5760",
          description: "Radio PPI Dunia",
          isPrimary: true,
          title: "RPD",
          isAac: true,
        ),
      ],
    );
  }


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _playAudioStream() {
    _flutterRadioPlayer.addMediaSources(frpSource);
    _flutterRadioPlayer.play();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _playAudioStream();

              },
              child: Text('Play Audio Stream'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
