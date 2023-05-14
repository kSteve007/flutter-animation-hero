import 'package:flutter/material.dart';
import 'package:animation/models/Food.dart';
import 'package:animation/screens/details.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  List<Widget> _tripTiles = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _addFoods();
  }

  void _addFoods() {
    // get data from db
    List<Food> _foods = [
      Food(
          title: 'Camarones al Ajillo',
          price: '10.50',
          starts: '5',
          img: 'ajillo.jpg'),
      Food(
          title: 'Brochetas de Camarones',
          price: '8.50',
          starts: '5',
          img: 'brochetas.jpg'),
      Food(
          title: 'Pasta de Camarones',
          price: '8.00',
          starts: '4',
          img: 'pasta.jpg'),
      Food(
          title: 'Camarones con Verduras',
          price: '7.75',
          starts: '4',
          img: 'verduras.jpg'),
    ];

    _foods.forEach((Food food) {
      _tripTiles.add(_buildTile(food));
    });
  }

  Widget _buildTile(Food trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Details(food: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.starts} starts',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(trip.title,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: _listKey,
        itemCount: _tripTiles.length,
        itemBuilder: (context, index) {
          return _tripTiles[index];
        });
  }
}
