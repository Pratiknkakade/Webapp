import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RealTimeData extends StatefulWidget {
  @override
  _RealTimeDataState createState() => _RealTimeDataState();
}

class _RealTimeDataState extends State<RealTimeData> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('BookCollection').snapshots();

  Future<void> updateStatus(bool val, String id) async {
    FirebaseFirestore.instance.collection('BookCollection').doc(id).update({
      'status': val,
    });
  }

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
                  leading: CircleAvatar(),
                  title: Text(data['name']),
                  subtitle: Text(data['price'].toString()),
                  trailing: Switch(
                    // This bool value toggles the switch.
                    value: data['status'],
                    activeColor: Colors.black,
                    onChanged: (bool val) {
                      updateStatus(val, document.id.toString());
                    },
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
