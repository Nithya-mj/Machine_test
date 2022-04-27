import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/providers/home_provider.dart';
import 'package:machine_test/services/api.dart';
import 'package:machine_test/widgets/products.dart';
import 'package:machine_test/widgets/search_home.dart';
import 'package:provider/provider.dart';

import '../widgets/banner.dat.dart';
import '../widgets/categories.dart';
import '../widgets/product_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() => context.read<HomeProvider>().getData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchWidget(),
              CategoriesWidget(),
              HomeBanner(),
              ProductsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
