import 'package:dio_app/api/product_api.dart';
import 'package:dio_app/helpers/http_response.dart';
import 'package:dio_app/models/create_product_response.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class UpdateProductScreen extends StatefulWidget {
  int id;
  String title;
  String price;
  String description;
  String image;
  String category;

  UpdateProductScreen(
      {super.key,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  Future<void> updateProduct() async {
    HttpResponse<CreateProductResponse> httpResponse =
        await GetIt.instance<ProductAPI>().updateProduct(
            widget.id,
            widget.title,
            widget.price,
            widget.description,
            widget.image,
            widget.category);
    debugPrint(httpResponse.data!.title);
    debugPrint("Item updated");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.title,
                  onChanged: (value) {
                    setState(() {
                      widget.title = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a title',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: 10,
                  initialValue: widget.description,
                  onChanged: (value) {
                    setState(() {
                      widget.description = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a description',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.image,
                  onChanged: (value) {
                    setState(() {
                      widget.image = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a image URL',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.category,
                  onChanged: (value) {
                    setState(() {
                      widget.category = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter a category',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    child: const Text("Update"),
                    onPressed: () {
                      updateProduct();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
