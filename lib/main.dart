/* */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/* */
// import 'widgets/'

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      builder: (context, child) {
        return CupertinoTheme(
          // Instead of letting Cupertino widgets auto-adapt to the Material
          // theme (which is green), this app will use a different theme
          // for Cupertino (which is blue by default).
          data: CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: HomePage(
        title: '경기 용인시 기흥구 구갈로 28번길 21-11',
        body: '',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.body}) : super(key: key);

  final String title;
  final String body;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  int _pageIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontSize: 14)),
        centerTitle: true,
        elevation: 6,
        leading: Icon(
          Icons.notifications_none,
          color: Colors.black87
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.qr_code,
              color: Colors.black87
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.body),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _pageIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '뭐먹지'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '찜한가게'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '주문내역'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'My배민')
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}