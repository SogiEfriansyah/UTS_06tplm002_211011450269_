import 'package:flutter/material.dart';

void main() {
  runApp(ShoeApp());
}

class ShoeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShoeListScreen(),
    );
  }
}

class ShoeListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shoes = [
    {
      'name': 'Nike SB Zoom Blazer',
      'type': 'Mid Premium',
      'price': '₹8,795',
      'image': 'lib/assets/shoe1.png', // Add the image in your assets folder
      'bgColor': Colors.purple[50],
    },
    {
      'name': 'Nike Air Zoom Pegasus',
      'type': 'Men\'s Road Running Shoes',
      'price': '₹9,995',
      'image': 'lib/assets/shoe2.png',
      'bgColor': Colors.green[50],
    },
    {
      'name': 'Nike ZoomX Vaporfly',
      'type': 'Men\'s Road Racing Shoe',
      'price': '₹10,695',
      'image': 'lib/assets/shoe3.png',
      'bgColor': Colors.pink[50],
    },
    {
      'name': 'Nike Air Force 1 S50',
      'type': 'Older Kids\' Shoe',
      'price': '₹6,295',
      'image': 'lib/assets/shoe4.png',
      'bgColor': Colors.grey[200],
    },
    {
      'name': 'Nike Waffle One',
      'type': 'Men\'s Shoes',
      'price': '₹8,295',
      'image': 'lib/assets/shoe5.png',
      'bgColor': Colors.yellow[50],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Shoes',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('lib/assets/profile.jpg'), // Add profile image in assets
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoes.length,
        itemBuilder: (context, index) {
          final shoe = shoes[index];
          return ShoeCard(
            name: shoe['name'],
            type: shoe['type'],
            price: shoe['price'],
            image: shoe['image'],
            bgColor: shoe['bgColor'],
          );
        },
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final String name;
  final String type;
  final String price;
  final String image;
  final Color? bgColor;

  ShoeCard({
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 60,
            width: 60,
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(type, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              SizedBox(height: 8.0),
              Text(price, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
