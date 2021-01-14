import 'package:DolingerTestProject/domain/goods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dotted_decoration/dotted_decoration.dart';

Widget firstWidgetFourElements() {
  final products = <Goods>[
    Goods(title: 'Приборы', price: 10, quantity: 0),
    Goods(title: 'Соус тар-тар', price: 20, quantity: 0),
    Goods(title: 'Соус красный острый', price: 30, quantity: 0),
    Goods(
        title:
            'Фуагра с артишоками под антрикотом с подливкой фрамбле и соусом мармуазье',
        price: 99,
        quantity: 0),
    Goods(title: 'Фугу', price: 50, quantity: 0),
  ];

  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(
      padding: EdgeInsets.all(10.0),
      color: Colors.grey[200],
      child: ListView.builder(
        padding: EdgeInsets.all(0.0),
        // scrollDirection: Axis.vertical,
        itemCount: products == null ? 1 : products.length + 1,
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
          i -= 1;
          return Card(
            // elevation: 1.0,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              leading: Padding(
                padding: EdgeInsets.all(3.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        "https://i.stack.imgur.com/wA1h3.png"),
                  ),
                ),
              ),
              title: Row(
                children: <Widget>[
                  Expanded(
                    flex: 46,
                    child: Text(
                      products[i].title,
                      maxLines: 3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    flex: 40,
                    child: seccondWidgetButtons(context, products[i]),
                  ),
                ],
              ),
              trailing: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.money),
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget seccondWidgetButtons(BuildContext context, Goods goods) {
  return Container(
    // color: Colors.red,
    height: 50,
    child: Stack(
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
              onPressed: () {},
              color: Colors.grey[200],
              textColor: Colors.black,
              shape: CircleBorder(side: BorderSide.none),
              child: Align(
                alignment: Alignment.center,
                child: Text("—",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 14,
          right: 40,
          child: Container(
            width: 30,
            child: Text(
              '10',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        Positioned(
          bottom: 5,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            child: RaisedButton(
              onPressed: () {},
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
        // flex: 3
      ],
    ),
  );
}
