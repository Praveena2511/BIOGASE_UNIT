import 'package:flutter/material.dart';

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-commerce Product',
      home: Scaffold(
        appBar: AppBar(title: Text('E-commerce Product')),
        body: Center(
          child: ProductCard(
            product: Product(
              name: 'Example Product',
              imageUrl: 'https://example.com/product_image.jpg',
              description: 'This is a sample product description.',
              price: 29.99,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(widget.product.description),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.product.price.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (itemCount > 1) {
                              setState(() {
                                itemCount--;
                              });
                            }
                          },
                        ),
                        Text(itemCount.toString()),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              itemCount++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
