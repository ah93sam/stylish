import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Boots",
      "picture": "images/prodcuts/boots2.jpg",
      "price": 85,
      "size": "M",
      "color": "brown",
      "quantity": 1,
    },
    {
      "name": "Tshirt",
      "picture": "images/prodcuts/tshirt.jpg",
      "price": 50,
      "size": "M",
      "color": "gray",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_pricture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({this.cart_prod_name,
    this.cart_prod_pricture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(


        //===   leading section  =====
        leading: new Image.asset(
          cart_prod_pricture,
          width: 80.0,
          height: 100.0,
        ),

        //===   title section  =====
        title: new Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            //===   Row inside column  =====
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size :"),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                //   ====== the section of for the product color  =====
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color :"),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Text(cart_prod_color,
                      style: TextStyle(color: Colors.red)),
                ),

                //   ====== the section of for the product price  =====
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                "\$${cart_prod_price}",
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red
                ),
              ),
            ),
          ],
        ),

        trailing:



        Padding(
          padding: const EdgeInsets.all(0.0),
          child: new Column(

            children: <Widget>[
              new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
              new Text("$cart_prod_qty",),
              new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: () {}),


            ],
          ),
        ),
      ),
    );
  }
}
