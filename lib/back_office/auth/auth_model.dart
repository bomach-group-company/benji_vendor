class RegIndividual {
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? gender;
  String? password;
  String? username;
  String? shopName;
  String? phone;

  RegIndividual({
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.gender,
    required this.email,
    required this.password,
    required this.username,
    required this.shopName,
    required this.phone
  });

  Future<Map<String, dynamic>> toJson() async => {
        "first_name": firstName,
        "last_name": lastName,
        "gender": address,
        "address": email,
        "email": gender,
        "password": password,
      };
}
