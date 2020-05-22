import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';
import 'package:http/http.dart' as http;



class categories extends StatefulWidget {
  @override
  _categoriesState createState() => _categoriesState();
}

class _categoriesState extends State<categories> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(
                  child: Text(
                'الاطفال',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'DroidKufi',
                ),
              )),
              Tab(
                  child: Text(
                'الرجال',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'DroidKufi',
                ),
              )),
              Tab(
                  child: Text(
                'النساء',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'DroidKufi',
                ),
              )),
            ],
          ),
          body: TabBarView(
            children: [
              Products(),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}



class Products extends StatefulWidget {

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  Future getProductsData() async{
    var url = 'http://swordtech.net/catdemo/select-cat.php';
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }


  List<Widget> products = [
    Row(
      children: <Widget>[
        Expanded(
          child: GFCard(
            boxFit: BoxFit.cover,
            image: Image.network(
                'https://pa.namshicdn.com/product/A9/67726W/2-web-desktop-list.jpg'),
            title: GFListTile(
              title: Text('Apple Watch'),
              icon: GFIconButton(
                onPressed: null,
                icon: Icon(Icons.favorite_border),
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        Expanded(
          child: GFCard(
            boxFit: BoxFit.cover,
            image: Image.network(
                'https://pa.namshicdn.com/product/A1/67726W/2-web-desktop-list.jpg'),
            title: GFListTile(
                title: Text('Apple Watch'),
                icon: GFIconButton(
                  onPressed: null,
                  icon: Icon(Icons.favorite_border),
                  color: Colors.transparent,
                )),
          ),
        ),
      ],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final item = products[index];
        return item;
      },
    );
  }
}


