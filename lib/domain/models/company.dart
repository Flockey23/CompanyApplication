class Company {
  final int id;
  final String title;
  final String fioContact;
  final String phone;
  final String email;
  final String site;
  final int postcode;
  final String city;
  final String street;
  final int house;
  final int latitude;
  final int longitude;
  bool selected = false;

  Company({
    required this.id,
    required this.title,
    required this.fioContact,
    required this.phone,
    required this.email,
    required this.site,
    required this.postcode,
    required this.city,
    required this.street,
    required this.house,
    required this.latitude,
    required this.longitude
  });
}