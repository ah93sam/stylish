import 'package:flutter/material.dart';
import 'package:stylish/pages/product_details.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Boots",
      "picture": "images/prodcuts/boots2.jpg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Tshirt",
      "picture": "images/prodcuts/tshirt.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Jeans",
      "picture": "images/prodcuts/tshirt1.jpg",
      "old_price": 140,
      "price": 100,
    },

    {
      "name": "Shoes",
      "picture": "images/prodcuts/shoes.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Shoes",
      "picture": "images/prodcuts/shoes2.jpg",
      "old_price": 70,
      "price": 40,
    },
    {
      "name": "Short",
      "picture": "images/prodcuts/short.jpg",
      "old_price": 120,
      "price": 85,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_pricture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: new Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                    //here we are passing the value of the product to the product page
                      builder: (context) =>
                      new ProductDetails(
                        product_details_name: prod_name,
                        product_details_new_prices: prod_price,
                        product_details_old_prices: prod_old_price,
                        product_details_picture: prod_pricture,
                      ))),
              child: GridTile(
                  footer: Container(
                      color: Colors.white70,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child:new Text(prod_name, style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),),
                          ),

                          new Text("\$${prod_price}", style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),),
                        ],
                      )

                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),)
            ,
          )
      )
      ,
    );

  }
}