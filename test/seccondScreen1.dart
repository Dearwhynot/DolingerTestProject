// import 'package:DolingerTestProject/widgets/FourElements.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//Скрыть StatusBar
import 'package:flutter/services.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute(this.startText, this.showPlaceholderCirc);
  final String startText;
  final bool showPlaceholderCirc;

  Widget build(BuildContext context) {
    print(startText);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          title: '', url: startText, showPlaceholderCirc: showPlaceholderCirc),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.url, this.showPlaceholderCirc})
      : super(key: key);
  final String title;
  final String url;
  final bool showPlaceholderCirc;

  @override
  _MyHomePageState createState() =>
      _MyHomePageState(url: url, showPlaceholderCirc: showPlaceholderCirc);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({this.url, this.showPlaceholderCirc});
  final String url;
  final bool showPlaceholderCirc;
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     // _counter++;
  //   });
  // }

  //Скрыть StatusBar
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: CachedNetworkImage(
                      imageUrl: url,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      placeholder: showPlaceholderCirc
                          ? (context, url) => CircularProgressIndicator()
                          : null,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                ),
                // Column(
                //   children: [
                //     Text(
                //       'You have pushed the button this many times:',
                //     ),
                //   ],
                // ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Произвольный текст как заголовок',
                    style: Theme.of(context).textTheme.headline4,
                    // maxLines: 3,
                  ),
                ),
                // Align(
                //   alignment: Alignment.topCenter,
                //   child: Text(
                //     '$_counter',
                //     style: Theme.of(context).textTheme.headline4,
                //   ),
                // ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            // child: FirstWidgetFourElements(),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
