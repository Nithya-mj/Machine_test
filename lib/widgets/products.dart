import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/const.dart';
import '../common/hexcolor.dart';
import '../providers/home_provider.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: double.maxFinite,
      child: Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
          if(snapshot.homeModel?.homeData ==null){
            return SizedBox();
          }
          return ListView.builder(
            itemCount: snapshot.products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Container(
                  height: 280,
                  width: 156.0,
                  child: Container(
                    margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: HexColor("#FFEAEAEA"))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // _buildTopWidgets(context),
                        // _buildImageWidget(),
                        // _buildTruckWidget(),
                        // _buildofferWidget(),
                        // _buildPriceWidget(),
                        // _buildProductNameWidget(context),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          snapshot.products?[index].offer == 0 ? SizedBox() :
                          Stack(children: [
                            Image.asset(Const.redTag),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,),
                                  child: Text('${snapshot.products?[index].offer}',style: const TextStyle(color: Colors.white,fontSize: 10),),
                                ),
                                const Icon(Icons.percent,color: Colors.white,size: 10,),
                                const Text('OFF',style: TextStyle(color: Colors.white,fontSize: 10))
                              ],
                            )
                          ],),
                          Container(
                            //margin: const EdgeInsets.only(top: 10.0),
                            child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Image.asset(
                                  Const.favIcon,
                                  key: UniqueKey(),
                                  height: 19.0,
                                  width: 19.0,
                                )
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.network(snapshot.products?[index].image??'',height: 90,width: 90,),
                    )),
                Container(
                    margin: EdgeInsets.only( right: 11.0, left: 11.0),
                    child: snapshot.products![index].isExpress! ?
                    Image.asset(Const.truckImg,height: 14,width: 22,) : SizedBox()
                ),
                Container(
                  margin: EdgeInsets.only(top: 9.0, right: 11.0, left: 11.0),
                  child:snapshot.products![index].actualPrice! == snapshot.products![index].offerPrice! ? SizedBox() :
                      Text(snapshot.products?[index].actualPrice??'',style: TextStyle(decoration: TextDecoration.lineThrough,color: HexColor('#727272'),fontSize: 12),)
                ),
                Container(
                  margin: EdgeInsets.only(right: 11.0, left: 11.0),
                  child: Text(snapshot.products?[index].offerPrice ?? '',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                ),
                        Container(
                          margin: EdgeInsets.only( left: 11.0, top: 2.0),
                          child: Text(snapshot.products?[index].name ?? '',style: TextStyle(fontSize: 14,)),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: HexColor('#199B3B'),minimumSize: Size(110, 30)),
                            onPressed: (){},
                            child: Text('ADD'),

                          ),
                        )
                      ],
                    ),
                  )
              );
            },

          );
        }
      ),
    );
  }
  _buildTopWidgets(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 11.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Image.asset(
                  Const.favIcon,
                  key: UniqueKey(),
                  height: 19.0,
                  width: 19.0,
                )
            ),
          ),
        ],
      ),
    );
  }


  // _buildImageWidget() {
  //   return Consumer<HomeProvider>(
  //     builder: (context, snapshot,child) {
  //       return Expanded(
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
  //             child: Image.network(snapsh,height: 90,width: 90,),
  //           ));
  //     }
  //   );
  // }



  _buildTruckWidget() {
    return Container(
        margin: EdgeInsets.only(top: 5.0, right: 11.0, left: 11.0),
        child: Text('data',
          // maxLines: 2,
          // textAlign: TextAlign.start,
          // overflow: TextOverflow.ellipsis,
          //style: FontStyle.homeProductCardTitle),
        ));
  }

  _buildofferWidget() {
    return Container(
      margin: EdgeInsets.only(right: 11.0, left: 11.0, top: 2.0),
      child: Text('data'),
    );
  }

  _buildPriceWidget() {
    return Container(
      margin: EdgeInsets.only(top: 9.0, right: 11.0, left: 11.0),
      child: Text(
        "data",
        // maxLines: 1,
        // textAlign: TextAlign.start,
        // overflow: TextOverflow.ellipsis,
        // style: FontStyle.grey14SemiBold
      ),
    );
  }

  _buildProductNameWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11.0, left: 11.0),
      child: Row(
        children: [
          Text('data'
          ),
          Expanded(
              child: Container(
                child: Text('data'
                ),
                margin: EdgeInsets.only(left: 5.0),
              ))
        ],
      ),
    );
  }

}
