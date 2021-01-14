import 'package:DolingerTestProject/domain/goods.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:dotted_decoration/dotted_decoration.dart';

class FirstWidgetFourElements extends StatelessWidget {
  final products = <Goods>[
    Goods(title: 'Приборы', price: 10, quantity: 0),
    Goods(title: 'Соус тар-тар', price: 20, quantity: 0),
    Goods(title: 'Соус красный острый', price: 30, quantity: 0),
    Goods(
        title:
            'Фуагра с артишоками под антрикотом с подливкой фрамбле и соусом мармуазье',
        price: 4000,
        quantity: 0),
    Goods(title: 'Фугу', price: 50, quantity: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                color: Colors.blue[600],
                // decoration:
                //     BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  leading: Container(
                    margin: const EdgeInsets.all(5.0),
                    width: 50.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                        border: Border(
                            right:
                                BorderSide(width: 1, color: Colors.white24))),
                    padding: EdgeInsets.only(right: 12),
                    child: CachedNetworkImage(
                      imageUrl: 'http://via.placeholder.com/800x400',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.none,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  title: Container(
                    color: Colors.red,
                    child: Row(
                      // width: 10.0,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Text(products[i].title,
                              maxLines: 2,
                              style: TextStyle(
                                  // color:
                                  //     Theme.of(context).textTheme.title.color,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(products[i].title,
                              maxLines: 3,
                              style: TextStyle(
                                  // color:
                                  //     Theme.of(context).textTheme.title.color,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                  // trailing: Icon(Icons.keyboard_arrow_right,
                  //     // ignore: deprecated_member_use
                  //     color: Theme.of(context).textTheme.title.color),
                  // subtitle: subtitle(context, products[i]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Goods goods) {
  var color = Colors.grey;
  double indicatorLevel = 0;

  // switch (goods.level) {
  //   case 'Beginner':
  //     color = Colors.green;
  //     indicatorLevel = 0.33;
  //     break;
  //   case 'Interm':
  //     color = Colors.yellow;
  //     indicatorLevel = 0.66;
  //     break;
  //   case 'Advanced':
  //     color = Colors.red;
  //     indicatorLevel = 1;
  //     break;
  // }
  return Row(
    children: <Widget>[
      Expanded(
          child: LinearProgressIndicator(
              // ignore: deprecated_member_use
              backgroundColor: Theme.of(context).textTheme.title.color,
              value: indicatorLevel,
              valueColor: AlwaysStoppedAnimation(color)),
          flex: 1),
      SizedBox(
        width: 10,
      ),
      Expanded(
          child: Text(
            goods.title,
            // ignore: deprecated_member_use
            style: TextStyle(color: Theme.of(context).textTheme.title.color),
          ),
          flex: 3)
    ],
  );
}
