import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:webapp/MyProject_1/herolist/cartoon.dart';
import 'package:webapp/MyProject_1/herolist/cartoonDescription.dart';

class CartoonList extends StatefulWidget {
  const CartoonList({super.key});

  @override
  State<CartoonList> createState() => _CartoonListState();
}

class _CartoonListState extends State<CartoonList> {
  List<Cartoon> cartoonList = [
    Cartoon(
      imageUrl:
          'https://w.forfun.com/fetch/50/5081f28733ce69397d496a2dfdcedc2d.jpeg',
      name: 'Captain Cartoon',
      age: 30,
      power: 'Flight',
    ),
    Cartoon(
      imageUrl:
          'https://i.pinimg.com/474x/7c/39/01/7c3901eb64a7c6593d6f180fab381f48.jpg',
      name: 'Mega Toon',
      age: 28,
      power: 'Teleportation',
    ),
    Cartoon(
      imageUrl:
          'https://www.shutterstock.com/image-vector/happy-blue-bird-cartoon-flying-260nw-437415406.jpg',
      name: 'Wonder Sketch',
      age: 35,
      power: 'Invisibility',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    timeDilation = 5.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: Text(' cartoon list '),
      ),
      body: ListView.builder(
        itemCount: cartoonList.length,
        itemBuilder: (context, index) {
          return ListTile(
              leading: Hero(
            tag: cartoonList[index].imageUrl,

            //     child: Image.network(cartoonList[index].imageUrl)),
            // title: Text(cartoonList[index].name),
            // subtitle: Text(cartoonList[index].power),

            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CartoonDescription(cartoon: cartoonList[index])),
                  );
                },
                child: Image.network(
                  cartoonList[index].imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
