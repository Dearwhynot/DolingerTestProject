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
      color: Colors.grey[200],
      child: ListView.builder(
        itemCount: products == null ? 1 : products.length + 1,
        itemBuilder: (context, i) {
          if (i == 0) {
            return Container(
              child: Padding(
                // padding: EdgeInsets.only(left: 15),
                padding: EdgeInsets.all(10),
                child: Text(
                  'Дополнительно',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
            );
          }
          i -= 1;
          return Card(
            // elevation: 1.0,
            child: Container(
              // height: 57.0,
              // width: 57.8,
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                leading: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      child: Image(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                            "https://i.stack.imgur.com/wA1h3.png"),
                      ),
                    ),
                  ),
                ),
                title: Container(
                  // color: Colors.amber,
                  child: Row(
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
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(Icons.money),
                ),
                //     // ignore: deprecated_member_use
                //     color: Theme.of(context).textTheme.title.color),
                // subtitle: seccondWidgetButtons(context, products[i]),
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
    height: 50,
    child: Stack(
      // fit: StackFit.loose,
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
          color: Colors.grey[300],
          width: 55,
          height: 35,
          child: null,
        ),
        Positioned(
          bottom: 1,
          right: -3,
          child: Container(
            alignment: Alignment.center,
            child: FloatingActionButton(
              elevation: 2,
              mini: true,
              backgroundColor: Colors.grey[300],
              // child: Icon(const IconData(0xe15b, fontFamily: 'MaterialIcons'),
              //     color: Colors.black),
              child: Icon(Icons.remove, color: Colors.black),
              onPressed: () {
                print("Cliked");
              },
            ),
          ),
        ),
        // SizedBox(
        //   width: 10,
        // ),
        Positioned(
          bottom: 14,
          right: 44,
          child: Container(
            width: 20,
            child: Text(
              '10',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        // SizedBox(
        //   width: 10,
        // ),
        Positioned(
          bottom: 1,
          right: 63,
          child: Container(
            alignment: Alignment.center,
            child: FloatingActionButton(
              mini: true,
              elevation: 2,
              backgroundColor: Colors.grey[100],
              child: Icon(Icons.add, color: Colors.black),
              onPressed: () {
                print("Cliked");
              },
            ),
          ),
        ),
        // flex: 3
      ],
    ),
  );
}
