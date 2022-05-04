import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/const.dart';
import '../common/hexcolor.dart';
import '../models/home_model.dart';
import '../providers/home_provider.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  // List<Values>? values;
  @override
  void initState() {
    Future.microtask(() => context.read<HomeProvider>().getData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, snapshot, child) {
      final categoryItem = snapshot.homeModel?.homeData?.firstWhere(
        ((element) {
          if (element.type != null) {
            return element.type == "category";
          } else {
            return false;
          }
        }),
        orElse: () => HomeDatum(),
      );

      if (categoryItem == null || categoryItem.type == null) {
        return const SizedBox();
      }
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  right: 20,
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: HexColor('#FAE7E7'),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(40.0))),
                        ),
                        FadeInImage.assetNetwork(
                          placeholder: Const.placeholder,
                          image: categoryItem.values?[index].imageUrl ?? '',
                          height: 40,
                          width: 40,
                        )
                      ],
                    ),
                    Expanded(
                        child: Text(
                      categoryItem.values?[index].name ?? '',
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ))
                  ],
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: categoryItem.values?.length,
          ),
        ),
      );
    });
  }
}
