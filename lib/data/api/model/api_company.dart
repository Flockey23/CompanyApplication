import 'package:myapp/domain/models/company.dart';

class ApiCompany extends Company {
  ApiCompany({
  required id,
  required title,
  required fioContact,
  required phone,
  required email,
  required site,
  required postcode,
  required city,
  required street,
  required house,
  required latitude,
  required longitude,
  }) : super(
    id: id,
    title: title,
    fioContact: fioContact,
    phone: phone,
    email: email,
    site: site,
    postcode: postcode,
    city: city,
    street: street,
    house: house,
    latitude: latitude,
    longitude: longitude,
  );

  factory ApiCompany.fromJson(Map<String,dynamic> json) {
    return ApiCompany(
        id: json['id'] as int,
        title: json['title'] as String,
        fioContact: json['FIO_contact'] as String,
        phone: json['phone'] as String,
        email: json['email'] as String,
        site: json['site'] as String,
        postcode: json['postcode'] as int,
        city: json['city'] as String,
        street: json['street'] as String,
        house: json['house'] as int,
        latitude: json['latitude'] as int,
        longitude: json['longitude'] as int);
  }

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title': title,
    'FIO_contact': fioContact,
    'phone': phone,
    'email': email,
    'site': site,
    'postcode': postcode,
    'city': city,
    'street': street,
    'house': house,
    'latitude': latitude,
    'longitude': longitude,
  };
}