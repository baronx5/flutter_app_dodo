import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class selectedProductPage extends StatefulWidget {

  @override
  _selectedProductPageState createState() => _selectedProductPageState();
}

class _selectedProductPageState extends State<selectedProductPage> {




  @override
  Widget build(BuildContext context) {
    final dynamic getSelectedProductData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return <Widget>[
            SliverAppBar(
              expandedHeight: 600.0,
              backgroundColor: Colors.black54,
              iconTheme: IconThemeData(
                  color: Colors.black54
              ),
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: Icon(Icons.arrow_upward, size: 25,)),
                    background: Image.network(getSelectedProductData['imgUrl'], fit: BoxFit.cover,),
              ),
            )
          ];
        },
        body: Center(
          child: Text('Body here'),
        ),
      ),
    );
  }
}