
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/providers/home_provider.dart';
import 'package:provider/provider.dart';
import '../common/const.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 180,
      height: MediaQuery.of(context).size.height * 0.18,
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 20),
      child: Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
          if(snapshot.homeModel?.homeData ==null){
            return const SizedBox();
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container(
                  margin: const EdgeInsets.only(left: 10,right: 10,),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child:
                  // Image.network(snapshot.banner?[index].bannerUrl ??
                  //     'https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=612x612&w=0&h=jPhUdbj_7nWHUp0dsKRf4DMGaHiC16kg_FSjRRGoZEI=',),
                  FadeInImage.assetNetwork(placeholder: Const.placeholder, image: snapshot.banner?[index].bannerUrl ??'',placeholderCacheHeight: 60,placeholderCacheWidth: 80,)
                );
              },
            itemCount: snapshot.banner!.length,
            separatorBuilder: (BuildContext context, int index) { return Container(); },
          );
        }
      ),
    );
  }
}



