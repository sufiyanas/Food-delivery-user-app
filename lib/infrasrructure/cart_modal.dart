import 'package:food_deliever_app/infrasrructure/food_modal.dart';

class CartModal {
  final String dishname;
  final String orginalPrice;
  final String offerPrice;
  final String imageURL;
  int cartCount;
  bool isItemAddedInCart;
  final String hotalEmail;
  CartModal({
    required this.hotalEmail,
    required this.dishname,
    required this.orginalPrice,
    required this.offerPrice,
    required this.imageURL,
    this.cartCount = 1,
    this.isItemAddedInCart = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "Dishname": dishname,
      "OrginalPrice": orginalPrice,
      "OfferPrice": offerPrice,
      "imageURL": imageURL,
      "CartCount": cartCount,
      "IsItemAddedInCart": isItemAddedInCart,
      "hotalEmail": hotalEmail,
    };
  }

  static CartModal fromJson(Map<String, dynamic> json) {
    return CartModal(
      hotalEmail: json["hotalEmail"],
      dishname: json["Dishname"],
      orginalPrice: json["OrginalPrice"],
      offerPrice: json["OfferPrice"],
      imageURL: json["imageURL"],
      isItemAddedInCart: json["IsItemAddedInCart"],
      cartCount: json["CartCount"],
    );
  }
}
