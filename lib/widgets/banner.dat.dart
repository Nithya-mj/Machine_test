import 'package:flutter/cupertino.dart';
import 'package:machine_test/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../common/const.dart';

class HomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.maxFinite,
      child: Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
          if(snapshot.homeModel?.homeData ==null){
            return SizedBox();
          }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Image.network(snapshot.banner?[index].bannerUrl ??
                      'https://media.istockphoto.com/vectors/image-preview-icon-picture-placeholder-for-website-or-uiux-design-vector-id1222357475?k=20&m=1222357475&s=612x612&w=0&h=jPhUdbj_7nWHUp0dsKRf4DMGaHiC16kg_FSjRRGoZEI=',),
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
