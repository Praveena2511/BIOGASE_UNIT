import 'package:flutter/material.dart';

class ECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
  });
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Product 1',
      imageUrl:
          'https://image.made-in-china.com/2f0j00ihVgBpsWCcoH/China-Biogas-Storage-Tank-Manufacturer-Storage-Tank-for-Sale-with-Composite-Material-Made-in-China.jpg',
      price: 99.99,
    ),
    Product(
      name: 'Product 2',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRA2B_31-zdMBzBjoHD8hCo_ZRwE_jWTrj_bg&usqp=CAU',
      price: 149.99,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Commerce App'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 0.75, // Adjust the aspect ratio for image
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 14, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
