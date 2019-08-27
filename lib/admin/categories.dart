import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Categories'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('categories').snapshots(),
          builder: ( BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot ){
            if (snapshot.hasError)
              return  Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting: return new Text('Loading...');
              default:
                return  ListView(
                  children: snapshot.data.documents.map((DocumentSnapshot document) {
                    return  ListTile(
                      title:  Text(document['title']),
                      trailing: IconButton(
                        icon: Icon( Icons.delete , color: Colors.red, ),
                        onPressed: (){
                          Firestore.instance.collection('categories').document(document.documentID).delete();
                        },
                      ),
                    );
                  }).toList(),
                );
            }
          },
        ),
      ),
    );
  }
}
