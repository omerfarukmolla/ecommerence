import 'Productschild.dart';

class Products {
  final int Proid;
  final String Proval;
  final String Proname;
  final String Prodesc;
  final double Proprice;
  final List<Productschild> LProductschild;
  Products(
      {this.Proid,
      this.Proval,
      this.Proname,
      this.Prodesc,
      this.Proprice,
      this.LProductschild});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        Proid: json['proid'] as int,
        Proval: json['proval'] as String,
        Proname: json['proname'] as String,
        Prodesc: json['prodesc'] as String,
        Proprice: json['proprice'] as double,
        LProductschild: json["productchild"]
            .map<Productschild>((jsonprs) => Productschild.fromJson(jsonprs))
            .toList());
  }
}
