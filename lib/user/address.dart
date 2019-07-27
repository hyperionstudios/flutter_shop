class Address {

  String streetName;
  String streetNumber;
  String city;
  String state;
  String country;
  String postCode;

  Address.fromJson( Map<String,dynamic> jsonObject ){
    this.streetName = jsonObject['street_name'];
    this.streetNumber = jsonObject['street_number'];
    this.city = jsonObject['city'];
    this.state = jsonObject['state'];
    this.country = jsonObject['country'];
    this.postCode = jsonObject['post_code'];
  }

}