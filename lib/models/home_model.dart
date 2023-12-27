class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel({this.status, this.data});
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? HomeDataModel.fromJson(json['data']) : null;
  }
}

class HomeDataModel {
  List<BannerModel>? banners;
  List<ProductModel>? products;
  HomeDataModel({this.banners, this.products});

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <BannerModel>[];
      json['banners'].forEach((element) {
        banners!.add(BannerModel.fromJson(element));
      });
    }

    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((element) {
        products!.add(ProductModel.fromJson(element));
      });
    }
  }
}

class BannerModel {
  int? id;
  String? image;

  BannerModel({
    this.id,
    this.image,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  ProductModel({
    this.price,
    this.oldPrice,
    this.discount,
    this.name,
    this.description,
    this.inFavorites,
    this.inCart,
    this.id,
    this.image,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    description = json['description'];
    name = json['name'];
    inCart = json['in_cart'];
    inFavorites = json['in_favorites'];
  }
}

///////////////////////////////////

// class HomeModel {
//   bool? status;

//   Data? data;

//   HomeModel({this.status, this.data});

//   HomeModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
// }

// class Data {
//   List<Banners>? banners;
//   List<Products>? products;
//   String? ad;

//   Data({this.banners, this.products, this.ad});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['banners'] != null) {
//       banners = <Banners>[];
//       json['banners'].forEach((v) {
//         banners!.add(Banners.fromJson(v));
//       });
//     }
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(Products.fromJson(v));
//       });
//     }
//     ad = json['ad'];
//   }
// }

// class Banners {
//   int? id;
//   String? image;

//   Banners({this.id, this.image});

//   Banners.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//   }
// }

// class Products {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic discount;
//   String? image;
//   String? name;
//   String? description;
//   List<String>? images;
//   bool? inFavorites;
//   bool? inCart;

//   Products(
//       {this.id,
//       this.price,
//       this.oldPrice,
//       this.discount,
//       this.image,
//       this.name,
//       this.description,
//       this.images,
//       this.inFavorites,
//       this.inCart});

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
// }
