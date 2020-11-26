class User_Info{
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User_Info({this.id, this.name, this.username, this.email,
    this.address, this.phone, this.website, this.company,});
  factory User_Info.fromJsonToInstance(Map<String,dynamic>data){
    Address tempAddress = Address.fromJsonToInstance(data['address']);
    Company tempCompany = Company.fromJsonToInstance(data['company']);
    return User_Info (
      id: data['id'],
      name: data['name'],
      username: data['username'],
      email: data['email'],
      address: tempAddress,
      phone:data['phone'],
      website:data['website'],
      company:tempCompany,
    );
  }
}

class Company{
  final String name;
  final String catchPhrase;
  final String bs;
  Company({this.name,this.catchPhrase,this.bs});
  factory Company.fromJsonToInstance(Map<String,dynamic>data){
    return Company(
      name: data['name'],
      catchPhrase: data['catchPhrase'],
      bs: data['bs'],
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;
  Address({this.street, this.suite,this.city,this.geo, this.zipcode});
  factory Address.fromJsonToInstance(Map<String,dynamic>data){
    Geo tempGeo = Geo.fromJsonToInstance(data['geo']);
    return Address(
      street: data['street'],
      suite: data['suite'],
      city: data['city'],
      zipcode: data['zipcode'],
      geo:tempGeo,

    );
  }
}
class Geo{
  final String lat;
  final String lng;
  Geo({this.lat, this.lng});
  factory Geo.fromJsonToInstance(Map<String,dynamic>data){
    return Geo(
      lat: data['lat'],
      lng: data['lng'],
    );
  }
}