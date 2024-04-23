import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:dio_app/helpers/http_response.dart';
import 'package:dio_app/models/create_product_response.dart';
import 'package:dio_app/models/delete_product_response.dart';
import 'package:dio_app/models/product.dart';
import 'package:dio_app/models/products_response.dart';

class ProductAPI {
  final BaseHttpDio baseHttpDio;

  ProductAPI(this.baseHttpDio);

  Future<HttpResponse<ProductsResponse>> getAllProducts() async {
    return baseHttpDio.resquest('/products', method: 'GET', parser: (data) {
      return ProductsResponse.fromJson(data);
    });
  }

  Future<HttpResponse<Product>> getSingleProduct(int id) async {
    return baseHttpDio.resquest('/products/$id', method: 'GET', parser: (data) {
      return Product.fromJson(data);
    });
  }

  Future<HttpResponse<DeleteProductResponse>> deleteProduct(int id) async {
    return baseHttpDio.resquest('products/$id', method: 'DELETE',
        parser: (data) {
      return DeleteProductResponse.fromJson(data);
    });
  }

  Future<HttpResponse<CreateProductResponse>> updateProduct(
      int id,
      String title,
      String price,
      String description,
      String image,
      String category) async {
    return baseHttpDio
        .resquest<CreateProductResponse>('products/$id', method: 'PUT', data: {
      "title": title,
      "price": price.toString(),
      "description": description,
      "image": image,
      "category": "electronics"
    }, parser: (data) {
      return CreateProductResponse.fromJson(data);
    });
  }
}
