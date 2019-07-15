import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> _words = [];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _appendNewWordToList(word) {
    setState(() {
      _words.add(word);
    });
  }

  void _addWord(BuildContext context) async {
    // Navigate to second route when tapped.
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondRoute()),
    );
    if (result != null) {
      _appendNewWordToList(result);
    }
    print(_words);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                child: ListView.builder(
              itemCount: _words.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Text(_words[index] != null ? _words[index] : 'null');
              },
            )),

            //     ListView(
            //   children: <Widget>[
            //     _words.map(w=>    {
            //     return ListTile(
            //       leading: Icon(Icons.map),
            //       title: Text(w)
            //     )}).
            //     // ListTile(
            //     //   leading: Icon(Icons.map),
            //     //   title: Text('Map'),
            //     // ),
            //     // ListTile(
            //     //   leading: Icon(Icons.photo_album),
            //     //   title: Text('Album'),
            //     // ),
            //     // ListTile(
            //     //   leading: Icon(Icons.phone),
            //     //   title: Text('Phone'),
            //     // ),
            //   ],
            // )),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
                child: Text('Open route'),
                onPressed: () => [_addWord(context), _incrementCounter()])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => [_addWord(context), _incrementCounter()],
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRoute extends StatelessWidget {
  String _word;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a word 😺"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter your marvelous word!'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, myController.text);
              },
              child: Text('Add!'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigate back to first route when tapped.
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
