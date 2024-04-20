import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:dio_app/helpers/http_response.dart';
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
}
