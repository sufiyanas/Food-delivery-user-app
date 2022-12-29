class UserModal {
  final String firstname;
  final String lastname;
  final String mobilenumber;
  final String imageurl;
  final String location;

  UserModal(
      {required this.firstname,
      required this.lastname,
      required this.mobilenumber,
      required this.imageurl,
      required this.location});

  Map<String, dynamic> tojson() {
    return <String, dynamic>{
      "Firstname": firstname,
      "Lastname": lastname,
      "MobileNumber": mobilenumber,
      "imageUrl": imageurl,
      "Location": location,
    };
  }

  static UserModal fromjson(Map<String, dynamic> json) => UserModal(
      firstname: json["Firstname"],
      lastname: json["Lastname"],
      mobilenumber: json["MobileNumber"],
      imageurl: json["imageUrl"],
      location: json["Location"]);
}
