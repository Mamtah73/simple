// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/widgets/drawer.dart';
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
    super.initState();
    loadData();
  }

  loadData() async {
    final catelogJson = await rootBundle.loadString("assets/files/files.json");
    final decodeData = jsonDecode(catelogJson);
    final productsData = decodeData["products"];
    CatelogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final CatlogModelList = List.generate(10, (index) => CatlogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catelog App",
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatelogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatelogModel.items[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
