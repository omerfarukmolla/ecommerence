import 'OrdersChild.dart';

class Orders {
  final int ordid;
  final DateTime orddatetime;
  final double ordamount;
  final List<OrdersChild> lOrdersChild;
  Orders({this.ordid, this.orddatetime, this.ordamount,this.lOrdersChild});

  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
      ordid: json['ordid'] as int,
      orddatetime: DateTime.parse(json['orddatetime']) ,
      ordamount: json['ordamount'] as double,
      lOrdersChild : json["orderschild"]
            .map<OrdersChild>((jsonprs) => OrdersChild.fromJson(jsonprs))
            .toList()
    );
  }
}
