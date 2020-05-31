import '../model/ProductschildArgument.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../utilities/constants.dart';

class ProductDetail extends StatefulWidget {
   final ProductschildArgument _arguments ;
ProductDetail({@required ProductschildArgument arguments}) : _arguments = arguments;


  @override
  State<StatefulWidget> createState() => _ProductDetailState(_arguments);
}

class _ProductDetailState extends State with TickerProviderStateMixin {
  final ProductschildArgument arguments ;
  _ProductDetailState(this.arguments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left,
              size: 40.0,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          
          ),
           actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.of(context).pushNamed(Constants.ROUTE_PRODUCT_BASKET);
            },
          )
        ],
          backgroundColor: Colors.white,
          title: Text(
            "Product Detail",
            style: TextStyle(color: Colors.black),
          )),
      body: _buildProductDetails(context),
      bottomNavigationBar: _buildButtomNavigationBar(),
    );
  }

  _buildProductDetails(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildProductImages(),
              _buidProductTitle(),
              SizedBox(
                height: 12.0,
              ),
              buildProductPrice(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildFurtherInfo(),
              SizedBox(
                height: 12.0,
              ),
              _buildDivider(size),
              SizedBox(
                height: 12.0,
              ),
              _buildSizeArea(),
              SizedBox(
                height: 12.0,
              ),
              _buildInfo(),
            ],
          ),
        )
      ],
    );
  }

  _buildProductImages() {
    TabController imagesController = TabController(length: 3, vsync: this);
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        height: 250.0,
        child: Center(
          child: DefaultTabController(
            length: 3,
            child: Stack(
              children: <Widget>[
                TabBarView(
                  controller: imagesController,
                  children: <Widget>[
                    Image.network(
                        this.arguments.pr.LProductschild[0].Prochimg1),
                    Image.network(
                        "https://images-na.ssl-images-amazon.com/images/I/61fPY2WLkTL._UX385_.jpg"),
                    Image.network(
                        "https://images-na.ssl-images-amazon.com/images/I/61fPY2WLkTL._UX385_.jpg")
                  ],
                ),
                Container(
                  alignment: FractionalOffset(0.5, 0.95),
                  child: TabPageSelector(
                      controller: imagesController,
                      selectedColor: Colors.grey,
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buidProductTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Center(
        child: Text(
          this.arguments.pr.Proname,
          style: TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }

  buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Text(
            "\$100",
            style: TextStyle(fontSize: 16.0, color: Colors.black),
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\$200",
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
                
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            "\%50 indirim",
            style: TextStyle(fontSize: 12.0, color: Colors.blue),
          ),
        ],
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey,
          width: screenSize.width,
          height: 0.25,
        )
      ],
    );
  }

  _buildFurtherInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.local_offer,
            color: Colors.grey,
          ),
          SizedBox(width: 12.0),
          Text("Daha Fazla bilgi için tıklayınız ",
              style: TextStyle(color: Colors.grey))
        ],
      ),
    );
  }

  _buildSizeArea() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.straighten,
                color: Colors.grey,
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                "Beden : M",
                style: TextStyle(color: Colors.grey, fontSize: 12.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                "Beden Tablosu",
                style: TextStyle(color: Colors.blue, fontSize: 12.0),
              )
            ],
          )
        ],
      ),
    );
  }

  _buildInfo() {
    TabController tabController = TabController(length: 2, vsync: this);

    return Container(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(
                child:
                    Text("Ürün Bilgisi", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text("Yıkama Bilgisi",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            height: 40.0,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                Text("%60 Pamuk %30 Polyester",
                    style: TextStyle(color: Colors.black)),
                Text("30 Derece makinada renkli yıkama",
                    style: TextStyle(color: Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
// user defined function
  void _showDialog(String msg) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Mesaj"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Kapat"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  _buildButtomNavigationBar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {},
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.list, color: Colors.white),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text("İsteklere Ekle", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () async {
                Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
                final SharedPreferences prefs = await _prefs;
                int ordID = prefs.getInt("orderID");
                int proid = this.arguments.pr.Proid;
                double price = this.arguments.pr.Proprice;
                final responseOrder = await http.Client().post(
                'http://ecommerence.herokuapp.com/OrdersChild/Insert',
                headers: <String, String>{
                  'Content-Type': 'application/json; charset=UTF-8',
                },
                body: convert.jsonEncode(<String, String>{
                  "Ordchordid": ordID.toString(),
                  "Ordchproid": proid.toString(),
                  "Ordchprice":price.toString(),
                  "Ordchdatedime":DateTime.now().toIso8601String(),

                }));
                _showDialog("Sepete Eklendi.");
              },
              color: Colors.greenAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.card_travel, color: Colors.white),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text("Sepete Ekle", style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
