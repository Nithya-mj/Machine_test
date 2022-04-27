import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/const.dart';
import '../common/hexcolor.dart';

class ProductTile extends StatelessWidget {
  // int? index;
  // int? length;
  // Products? product;
  // final Function? productTileClickListener;
  // final LocalProducts? localProducts;
  // final Function? onFavouriteTap;

  ProductTile(
      {Key? key,})
        // this.index,
        // this.localProducts,
        // this.onFavouriteTap,
        // this.length,
        // this.product,
        // this.productTileClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index){
        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          // height: 285,
          width: 156.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(color: HexColor("#FFEAEAEA"))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopWidgets(context),
              _buildImageWidget(),
              //_buildRatingCountWidget(),
              _buildTitleWidget(),
              _buildSubTitleWidget(),
              _buildPriceWidget(),
              _buildPriceOfferWidget(context),
              //_buildEmiWidget(),
              //_buildReviewCountWidget()
            ],
          ),
        );
      },

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
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
  //     child: CustomFadeImage(
  //       placeHolder: 'assets/images/place_holder_product.png',
  //       url: "${product!.image}",
  //       height: 120.h,
  //       width: 120.w,
  //     ),
  //     height: 120.h,
  //     width: double.maxFinite,
  //   );
  // }

  _buildImageWidget() {
    return Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
          child: Image.asset(Const.bannerImg,height: 10,width: 10,),
        ));
  }

  // _buildRatingCountWidget() {
  //   return product != null && product?.ratingData != null
  //       ? Container(
  //     margin: EdgeInsets.only(top: 3.h, right: 11.w, left: 11.w),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Text(
  //             (product?.ratingData?.ratingAggregationValue ?? 0.0) == 0.0
  //                 ? ""
  //                 : "${product?.ratingData?.ratingAggregationValue}",
  //             textAlign: TextAlign.start,
  //             style: FontStyle.black12Medium),
  //         SizedBox(width: 3.w),
  //         product?.ratingData!.productReviewCount != null &&
  //             (product?.ratingData?.ratingAggregationValue ?? 0) == 0
  //             ? Container()
  //             : Image.asset(Const.edgedStarIcon, height: 11.w, width: 11.w),
  //       ],
  //     ),
  //   )
  //       : Container();
  // }

  _buildTitleWidget() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, right: 11.0, left: 11.0),
      child: Text('data',
          // maxLines: 2,
          // textAlign: TextAlign.start,
          // overflow: TextOverflow.ellipsis,
          //style: FontStyle.homeProductCardTitle),
    ));
  }

  _buildSubTitleWidget() {
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

  _buildPriceOfferWidget(BuildContext context) {
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

  // _buildEmiWidget() {
  //   return Container(
  //       margin:
  //       EdgeInsets.only(top: 9.h, right: 11.w, left: 11.w, bottom: 8.h),
  //       child: (product?.emiData?.value ?? '').isEmpty
  //           ? Text('', style: FontStyle.emiPrice)
  //           : Row(
  //         children: [
  //           Text(product?.emiData?.label ?? '',
  //               maxLines: 1,
  //               textAlign: TextAlign.start,
  //               style: FontStyle.grey6A6A6A_12Medium),
  //           Expanded(
  //               child: Container(
  //                 child: Text(product?.emiData?.value ?? '',
  //                     textAlign: TextAlign.start,
  //                     maxLines: 1,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: FontStyle.emiPrice),
  //                 margin: EdgeInsets.only(left: 5.w),
  //               ))
  //         ],
  //       ));
  // }

  // Widget _buildReviewCountWidget() {
  //   return product?.ratingData != null
  //       ? Container(
  //     margin: EdgeInsets.only(top: 5.h,right: 11.w, left: 11.w,bottom: 10.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: [
  //         Text(product?.ratingData?.productReviewCountOnly == null ||
  //             product?.ratingData?.productReviewCountOnly == "" ||
  //             product?.ratingData?.productReviewCountOnly == "0"
  //             ? ""
  //             : "(${product?.ratingData?.productReviewCountOnly}) Reviews",
  //             textAlign: TextAlign.start,
  //             style: FontStyle.black12Regular),
  //       ],
  //     ),
  //   )
  //       : Container();
  // }
}