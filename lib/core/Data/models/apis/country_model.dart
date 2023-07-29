class Country {
  String country;
  String alpha2;
  String alpha3;
  double numeric;
  double latitude;
  double longitude;

  Country({
    required this.country,
    required this.alpha2,
    required this.alpha3,
    required this.numeric,
    required this.latitude,
    required this.longitude,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
      alpha2: json['alpha2'],
      alpha3: json['alpha3'],
      numeric: json['numeric'].toDouble(), // تحويل المتغير إلى double هنا
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
