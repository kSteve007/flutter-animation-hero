import 'package:flutter/material.dart';
import 'package:animation/models/Food.dart';
import 'package:animation/shared/heart.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

class Details extends StatelessWidget {
  final Food food;
  Details({@required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  child: Hero(
                tag: 'location-img-${food.img}',
                child: Image.asset(
                  'images/${food.img}',
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              )),
              SizedBox(height: 30),
              ListTile(
                  title: Text(food.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[800])),
                  subtitle: Text(
                      '${food.starts} starts food for only \$${food.price}',
                      style: TextStyle(letterSpacing: 1)),
                  trailing: Heart()),
              Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                      lipsum.createText(numParagraphs: 1, numSentences: 2),
                      style: TextStyle(color: Colors.grey[600], height: 1.4))),
            ],
          ),
        ));
  }
}
