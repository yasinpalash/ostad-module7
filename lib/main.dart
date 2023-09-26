import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Counter App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductList()));

          }, child:const Text('GO to productList') ))
        ],
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product List'),),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
          return ListTile(
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ProductDetails(productname: index.toString());
              }));
            },
            title: Text(index.toString()),
          );
      },


      ),
    );
  }
}
class ProductDetails extends StatelessWidget {

  final String productname;
  const ProductDetails({super.key,required this.productname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Details'),),
      body:Center(child:
        Text(productname,style: TextStyle(fontSize: 30),)

        ,),
    );
  }
}



