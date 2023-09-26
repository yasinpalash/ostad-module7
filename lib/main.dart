import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 15),
    Product(name: 'Product 3', price: 20),
    Product(name: 'Product 4', price: 10),
    Product(name: 'Product 5', price: 15),
    Product(name: 'Product 6', price: 20),
    Product(name: 'Product 7', price: 10),
    Product(name: 'Product 8', price: 15),
    Product(name: 'Product 9', price: 20),
    Product(name: 'Product 10', price: 10),
    Product(name: 'Product 11', price: 15),
    Product(name: 'Product 12', price: 20),
  ];

  int totalItemsInCart = 0;

  void buyProduct(Product product) {
    setState(() {
      product.incrementCounter();
      totalItemsInCart++;
      if (product.counter == 5) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Congratulations!'),
              content: Text('You\'ve bought 5 ${product.name}!'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(productsInCart: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,

      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('Price: \$${products[index].price}'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Count: ${products[index].counter}'),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () => buyProduct(products[index]),
                          child: const Text('Buy Now'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: goToCart,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}

class CartPage extends StatelessWidget {
  final List<Product> productsInCart;

  CartPage({required this.productsInCart});

  @override
  Widget build(BuildContext context) {
    int totalItemsInCart = productsInCart.fold(0, (sum, product) => sum + product.counter);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Items in Cart: $totalItemsInCart'),
      ),
    );
  }
}
