import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:otlob/models/product_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<ProductModel>>(
            future: getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${'this is an error'}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.75),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: snapshot.data![index].thumbnail,
                            // placeholder: (context, url) =>
                            //     CircularProgressIndicator(),
                            // errorWidget: (context, url, error) =>
                            //     Icon(Icons.error),
                          ),
                          Text(
                            snapshot.data![index].title,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  });
            }));
  }

  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];
    Dio dio = Dio();
    Response response = await dio.get('https://dummyjson.com/products');
    // response.data['products'].forEach((prdouct) {
    //   products.add(prdouct);
    // });
    for (var product in response.data['products']) {
      // print(product);
      products.add(ProductModel.fromjson(product));
    }
    print(products[0].title);
    return products;
  }
}



// class HomeView extends StatefulWidget {
//   HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//           itemCount: products.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2, childAspectRatio: 0.75),
//           itemBuilder: (context, index) {
//             return Card(
//               child: Column(
//                 children: [
//                   Image.network(products[index]['thumbnail']),
//                   Text(
//                     products[index]['title'],
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }

//   getAllProducts() async {
//     Dio dio = Dio();
//     Response response = await dio.get('https://dummyjson.com/products');

//     // response.data['products'].forEach((prdouct) {
//     //   products.add(prdouct);
//     //   setState(() {});
//     // });

//     // response.data['products'].map((product) {
//     //   products.add(product);
//     // }).toList();

//     for (var product in response.data['products']) {
//       products.add(product);
//     }
//     print(products[0]['title']);
//     return products;
//   }
// }
