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
    final dynamic gerSelectedProductData = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          title: Text(gerSelectedProductData['name']),
      ),
    );
  }
}
