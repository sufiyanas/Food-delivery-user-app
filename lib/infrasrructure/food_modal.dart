class User {
  String id;
  final String dishname;
  final String aboutdish;
  final String increadients;
  final String orginalPrice;
  final String offerPrice;
  final String imageURL;

  User({
    required this.orginalPrice,
    required this.offerPrice,
    this.id = "",
    required this.dishname,
    required this.aboutdish,
    required this.increadients,
    required this.imageURL,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        'DishName': dishname,
        'AboutDish': aboutdish,
        'Increadients': increadients,
        'OrginalPrice': orginalPrice,
        'OfferPrice': offerPrice,
        'imageURL': imageURL,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        dishname: json["DishName"],
        aboutdish: json["AboutDish"],
        increadients: json["Increadients"],
        offerPrice: json["OfferPrice"],
        orginalPrice: json["OrginalPrice"],
        imageURL: json['imageURL'],
      );
}
