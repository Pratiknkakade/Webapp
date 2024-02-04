import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookRealTime extends StatefulWidget {
  @override
  _BookRealTimeState createState() => _BookRealTimeState();
}

class _BookRealTimeState extends State<BookRealTime> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('BookCollection').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return ListTile(
                  title: Text(data['name']),
                  subtitle: Text(data['price'].toString()),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
