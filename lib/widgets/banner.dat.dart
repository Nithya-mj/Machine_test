
import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/models/home_model.dart';
import 'package:machine_test/providers/home_provider.dart';
import 'package:provider/provider.dart';
import '../common/const.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 0.18;
    return
      // Container(
      // //height: MediaQuery.of(context).size.height * 0.18,
      // height: height,
      // width: double.maxFinite,
      // margin: const EdgeInsets.only(bottom: 20),
      // child:
      Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
         /* bool isbannerItem = false;
          var bannerItem;
          int? length = snapshot.homeModel?.homeData?.length;
          for(int i = 0;i<length! ; i++){
            if(snapshot.homeModel?.homeData?[i].type == 'banners'){
              bannerItem = snapshot.homeModel?.homeData?[i];
              isbannerItem=true;
              height=height;
            }else{
            }
          }*/
          final bannerItem = snapshot.homeModel?.homeData?.firstWhere(
            ((element) {
              if (element.type != null) {
                return element.type == "banners";
              } else {
                return false;
              }
            }),
            orElse: () => HomeDatum(),
          );

          if( bannerItem == null || bannerItem.type ==null){
            return const SizedBox();
          }
          /*return ListView.separated(
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
                  // FadeInImage.assetNetwork(placeholder: Const.placeholder, image: snapshot.banner?[index].bannerUrl ??'',placeholderCacheHeight: 60,placeholderCacheWidth: 80,)
                  CachedNetworkImage(
                    imageUrl: snapshot.banner?[index].bannerUrl ??'',
                    placeholder: (context,url)=> Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      //child: Image.asset(Const.placeholder,height: 10,width: 10,),
                    ),
                    // fit: BoxFit.fill,
                  )
                );
              },
            itemCount: snapshot.banner!.length,
            separatorBuilder: (BuildContext context, int index) { return Container(); },
          );*/
          return Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width:  double.maxFinite,
            margin: const EdgeInsets.only(bottom: 20),
            child: PageView.builder(
              padEnds: false,
              controller: PageController(
                initialPage: 0,
                  viewportFraction: 0.9
              ),
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Container(
                    width: double.maxFinite,
                      margin: const EdgeInsets.only(left:10,right: 10,),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child:
                      // FadeInImage.assetNetwork(placeholder: Const.placeholder, image: snapshot.banner?[index].bannerUrl ??'',placeholderCacheHeight: 30,placeholderCacheWidth: 30,fit: BoxFit.fill,)
                    CachedNetworkImage(
                      //imageUrl: snapshot.banner?[index].bannerUrl ??'',
                      imageUrl: bannerItem.values?[index].bannerUrl??'',
                      placeholder: (context,url)=> Card(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        //child: Image.asset(Const.placeholder,height: 10,width: 10,),
                      ),
                      fit: BoxFit.fill,
                    )
                  );
                },
              itemCount: bannerItem.values?.length ?? 0,
            ),
          );
        }
      );
   // );
  }
}


