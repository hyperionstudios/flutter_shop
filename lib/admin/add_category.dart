import 'package:cloud_firestore/cloud_firestore.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategoryScreen extends StatefulWidget {
  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {

  TextEditingController _categoryTitleController = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool isError = false;

  @override
  void dispose() {
    _categoryTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Category'),
      ),
      body: ( isLoading ) ? _loading() : _categoryForm()
    );
  }



  Widget _loading(){
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _categoryForm(){
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: _categoryTitleController,
                validator: ( value ){
                  if( value.isEmpty ){
                    return 'Category Title is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Category Title'
                ),
              ),
            ),
            SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only( left: 16 ),
              child: RaisedButton(
                child: Text('Save Category'),
                onPressed: () async {
                  if( _formKey.currentState.validate() ){
                    setState(() {
                      isLoading = true;
                    });
                    var response = await Firestore.instance.collection('categories').where( 'title' , isEqualTo: _categoryTitleController.text ).snapshots().first;
                    if( response.documents.length >= 1 ){
                      setState(() {
                        isLoading = false;
                        isError = true;
                      });
                    }else{
                      Firestore.instance.collection('categories').document().setData(
                          {
                            'title' : _categoryTitleController.text
                          }
                      ).then(( onValue ){
                        _categoryTitleController.text = '';
                      });
                      setState(() {
                        isLoading = false;
                        isError = false;
                      });
                    }
                  }
                },
              ),
            ),
            ( isError ) ? _error() : Container()
          ],
        ),
      ),
    );
  }

  Widget _error(){
    return Container(
      child: Center(
        child: Text('Error, duplicate entry' , style: TextStyle(color: Colors.red),),
      ),
    );
  }
}
