import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Products'),
      ),
      body: _drawProducts(),
    );
  }

  Widget _drawProducts(){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('products').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
              return ListTile(
                title: Text(document['product_title']),
                subtitle: Text(document['product_price']),
              );
            }).toList(),
            );
        }
      },
    );
  }
}
