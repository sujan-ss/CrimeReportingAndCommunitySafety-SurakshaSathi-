class User {
  String id;
  String firstName;
  String lastName;
  String email;
  String number;

  String imageUrl;
  String passportImageUrl;
  bool verified;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.number,
    required this.imageUrl,
    required this.passportImageUrl,
    required this.verified,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      number: json['number'],
      imageUrl: json['imageUrl'],
      passportImageUrl: json['passportImageUrl'],
      verified: json['verified'],
    );
  }
}
