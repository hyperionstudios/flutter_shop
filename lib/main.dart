import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'admin/categories.dart';
import 'admin/add_category.dart';
import 'admin/add_product.dart';
import 'admin/products.dart';


void main() {
  runApp(FlutterShop());
}

class FlutterShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthTest(),
      theme: ThemeData(
        primaryColor: Colors.teal
      ),
      routes: {
        '/add_category' : ( context ) => AddCategoryScreen(),
        '/categories'   : ( context ) => AllCategories(),
        '/add_product'  : ( context ) => AddProduct(),
        '/products'     : ( context ) => AllProducts(),
      },
    );
  }
}

class AuthTest extends StatefulWidget {
  @override
  _AuthTestState createState() => _AuthTestState();
}

class _AuthTestState extends State<AuthTest> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text('All Products'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/products');
              },
            ),
            ListTile(
              title: Text('Add Product'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/add_product');
              },
            ),
            ListTile(
              title: Text('All Categories'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/categories');
              },
            ),
            ListTile(
              title: Text('Add Category'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/add_category');
              },
            ),
          ],
        ),
      ),
    );
  }
}
