import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:DolingerTestProject/domain/goods.dart';
//Скрыть StatusBar
// import 'package:flutter/services.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute(this.url, this.showPlaceholderCirc, this.quantityItems);
  final String url;
  final bool showPlaceholderCirc;
  final int quantityItems;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(
          url: url,
          showPlaceholderCirc: showPlaceholderCirc,
          quantityItems: quantityItems),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.url, this.showPlaceholderCirc, this.quantityItems})
      : super(key: key);
  final String url;
  final bool showPlaceholderCirc;
  final int quantityItems;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final products = <Goods>[
    Goods(
        title:
            'Фуагра с артишоками под антрикотом с подливкой фрамбле и соусом мармуазье',
        price: 99,
        quantity: 0,
        sum: 0),
    Goods(title: 'Приборы', price: 10, quantity: 0, sum: 0),
    Goods(title: 'Соус тар-тар', price: 20, quantity: 0, sum: 0),
    Goods(title: 'Соус красный острый', price: 30, quantity: 0, sum: 0),
    Goods(title: 'Фугу', price: 50, quantity: 0, sum: 0),
  ];
  var totalAmount = 0.0;
  int totalQuantity = 0;

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: CachedNetworkImage(
                            imageUrl: widget.url,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                            placeholder: widget.showPlaceholderCirc
                                ? (context, url) => CircularProgressIndicator()
                                : null,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Произвольный текст как заголовок',
                        style: Theme.of(context).textTheme.headline4,
                        // maxLines: 3,
                      ),
                    ),
                    Container(
                      height: 400.0,
                      // color: Colors.red,
                      child: firstWidgetFourElements(
                          widget.url, widget.quantityItems),
                      // child: null,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        decoration: DottedDecoration(
                          shape: Shape.line,
                          linePosition: LinePosition.top,
                          strokeWidth: 2.9,
                          dash: <int>[2, 6],
                        ),
                        child: Container(
                          decoration: DottedDecoration(
                            shape: Shape.line,
                            linePosition: LinePosition.bottom,
                            strokeWidth: 2.9,
                            dash: <int>[2, 6],
                          ),
                          child: Container(
                            height: 50.0,
                            color: Colors.grey[300],
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 10,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Дополнительно",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "x" + totalQuantity.toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      totalAmount.toStringAsFixed(2),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // child: null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstWidgetFourElements(String url, int itemCount) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        color: Colors.grey[200],
        child: ListView.builder(
          padding: EdgeInsets.all(0.0),
          // scrollDirection: Axis.vertical,
          // itemCount: products == null ? 1 : products.length + 1,
          itemCount: itemCount + 1,
          itemBuilder: (context, i) {
            if (i == 0) {
              return Padding(
                padding: EdgeInsets.only(top: 0, left: 10, bottom: 3),
                child: Text(
                  'Дополнительно',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              );
            }
            i--;
            return Card(
              // elevation: 1.0,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 2),
                leading: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(url),
                    ),
                  ),
                ),
                title: Row(
                  children: <Widget>[
                    Expanded(
                      // flex: 1,
                      child: Text(
                        products[i].title,
                        maxLines: 3,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      // flex: 1,
                      child: seccondWidgetButtons(context, products[i]),
                    ),
                  ],
                ),
                trailing: Container(
                  alignment: Alignment.center,
                  width: 55.0,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("+" + (products[i].price).toString() + " р.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget seccondWidgetButtons(BuildContext context, Goods goods) {
    // goods.quantity++;
    return Container(
      // color: Colors.red,
      height: 50,
      child: Stack(
        // fit: StackFit.expand,
        // alignment: Alignment.centerRight,
        children: <Widget>[
          Positioned(
            bottom: 7,
            right: 25,
            child: Container(
              color: Colors.grey[300],
              width: 55,
              height: 35,
              child: null,
            ),
          ),
          Positioned(
            bottom: 5,
            right: 67,
            child: Container(
              width: 40,
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  if (goods.quantity > 0) {
                    totalAmount = totalAmount - goods.price;
                    totalQuantity--;
                    goods.quantity--;
                    _incrementCounter();
                  }
                },
                // onPressed: () => _incrementCounter(i),
                color: Colors.grey[200],
                textColor: Colors.black,
                shape: CircleBorder(side: BorderSide.none),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("—",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25.0),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            right: 39,
            child: Container(
              width: 30,
              child: Text(
                (goods.quantity).toString(),
                // (_counter).toString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              // child: Text(
              //   _counter.toString(),
              // ),
            ),
          ),
          Positioned(
            bottom: 5,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              child: RaisedButton(
                onPressed: () {
                  if (goods.quantity < 20) {
                    totalAmount = totalAmount + goods.price;
                    totalQuantity++;
                    goods.quantity++;
                    _incrementCounter();
                  }
                },
                color: Colors.grey[200],
                textColor: Colors.black,
                shape: CircleBorder(side: BorderSide.none),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("+",
                      style: TextStyle(fontSize: 25.0),
                      textAlign: TextAlign.center),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
