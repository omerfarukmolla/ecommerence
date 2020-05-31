import 'Products.dart';
class OrdersChild {
  final int ordchid;
  final int ordchordid;
  final int ordchproid;
  final DateTime ordchdatedime;
  final double ordchprice;
  final Products products;
  OrdersChild(
      {this.ordchid,
      this.ordchordid,
      this.ordchproid,
      this.ordchprice,
      this.ordchdatedime,
      this.products});

  factory OrdersChild.fromJson(Map<String, dynamic> json) {
    return OrdersChild(
      ordchid: json['ordchid'] as int,
      ordchordid: json['ordchordid'] as int,
      ordchproid: json['ordchproid'] as int,
      ordchdatedime: DateTime.parse(json['ordchdatedime'])  ,
      ordchprice: json['ordchprice'] as double,
      products:Products.fromJson(json['ordchpro'])  
    );
  }
}
