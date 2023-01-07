class OrderModal {
  final String userEmail;
  final String hotalEmail;
  final String dishname;
  final String orginalPrice;
  final String imageURL;
  final int cartCount;
  final String userAddress;

  OrderModal({
    required this.userAddress,
    required this.userEmail,
    required this.hotalEmail,
    required this.dishname,
    required this.orginalPrice,
    required this.imageURL,
    required this.cartCount,
  });

  Map<String, dynamic> toJson() {
    return {
      "userAddress": userAddress,
      "Dishname": dishname,
      "OrginalPrice": orginalPrice,
      "imageURL": imageURL,
      "CartCount": cartCount,
      "hotalEmail": hotalEmail,
      "UserEmail": userEmail,
    };
  }

  static OrderModal fromJson(Map<String, dynamic> json) {
    return OrderModal(
      userAddress: json["userAddress"],
      hotalEmail: json["hotalEmail"],
      dishname: json["Dishname"],
      orginalPrice: json["OrginalPrice"],
      imageURL: json["imageURL"],
      userEmail: json["UserEmail"],
      cartCount: json["CartCount"],
    );
  }
}
