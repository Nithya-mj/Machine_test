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
      // height: MediaQuery.of(context).size.height * 0.30,
      width: double.maxFinite,
      child: Consumer<HomeProvider>(
        builder: (context, snapshot,child) {
          if(snapshot.homeModel?.homeData ==null){
            return const SizedBox();
          }
          return ListView.builder(
            itemCount: snapshot.products!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return Container(
                  // height: 280,
                  // height: MediaQuery.of(context).size.height * 0.20,
                  width: 170.0,
                  margin: const EdgeInsets.only(left: 10),
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: HexColor("#FFEAEAEA"))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          snapshot.products?[index].offer == 0 ? SizedBox() :
                          Stack(children: [
                            Image.asset(Const.redTag),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 3.0,),
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
                      child:
                      //Image.network(snapshot.products?[index].image??'',height: 90,width: 90,),
                      FadeInImage.assetNetwork(placeholder: Const.placeholder, image: snapshot.products?[index].image ??'',height: 90,width: 90,)
                    )),
                Container(
                    margin: const EdgeInsets.only( left: 11.0),
                    child: snapshot.products![index].isExpress! ?
                    Image.asset(Const.truckImg,height: 14,width: 22,) : const SizedBox()
                ),
                Container(
                  margin: const EdgeInsets.only( left: 11.0),
                  child:snapshot.products![index].actualPrice! == snapshot.products![index].offerPrice! ? SizedBox() :
                      Text(snapshot.products?[index].actualPrice??'',style: TextStyle(decoration: TextDecoration.lineThrough,color: HexColor('#727272'),fontSize: 12),)
                ),
                Container(
                  margin: const EdgeInsets.only( left: 11.0),
                  child: Text(snapshot.products?[index].offerPrice ?? '',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                ),
                        Container(
                            margin: const EdgeInsets.only( left: 11.0,),
                            child: Text(snapshot.products?[index].name ?? '',style: TextStyle(fontSize: 14,),maxLines: 2,),
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
}
