import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _productTitleController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    _productTitleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _productTitleController,
                decoration: InputDecoration(hintText: 'Product Title'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: _productDescriptionController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Product Description',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Description is requied';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _productPriceController,
                keyboardType: TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  hintText: 'Product Price',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Price is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 32,
              ),
              RaisedButton(
                color: Colors.teal,
                child: Text(
                  'Save Product', style: TextStyle(color: Colors.white),),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Firestore.instance.collection('products').document()
                        .setData({
                      'product_title': _productTitleController.text,
                      'product_description': _productDescriptionController.text,
                      'product_price': _productPriceController.text
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
