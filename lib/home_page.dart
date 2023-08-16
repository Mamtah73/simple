import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widgets/item_wiget.dart';

import 'models/catelog.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;
  final String name = "mamta";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catelogJson = await rootBundle.loadString("assets/files/files.json");
    final decodeData = jsonDecode(catelogJson);
    var productsData = decodeData["products"];
    // print(productsData);
    CatlogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: CatlogModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: CatlogModel.items[index],
          );
        },
      ),
    );
  }
}
