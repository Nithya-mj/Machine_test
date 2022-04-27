class HomeModel {
  bool? status;
  List<HomeData>? homeData;

  HomeModel({this.status, this.homeData});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['homeData'] != null) {
      homeData = <HomeData>[];
      json['homeData'].forEach((v) {
        homeData!.add(HomeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    if (homeData != null) {
      data['homeData'] = homeData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeData {
  String? type;
  List<Values>? values;

  HomeData({this.type, this.values});

  HomeData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  int? id;
  String? name;
  String? imageUrl;
  String? bannerUrl;
  String? image;
  String? actualPrice;
  String? offerPrice;
  int? offer;
  bool? isExpress;

  Values(
      {this.id,
        this.name,
        this.imageUrl,
        this.bannerUrl,
        this.image,
        this.actualPrice,
        this.offerPrice,
        this.offer,
        this.isExpress});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    bannerUrl = json['banner_url'];
    image = json['image'];
    actualPrice = json['actual_price'];
    offerPrice = json['offer_price'];
    offer = json['offer'];
    isExpress = json['is_express'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['banner_url'] = bannerUrl;
    data['image'] = image;
    data['actual_price'] = actualPrice;
    data['offer_price'] = offerPrice;
    data['offer'] = offer;
    data['is_express'] = isExpress;
    return data;
  }
}
