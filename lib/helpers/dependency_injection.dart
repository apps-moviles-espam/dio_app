import 'package:dio/dio.dart';
import 'package:dio_app/api/product_api.dart';
import 'package:dio_app/helpers/base_http_dio.dart';
import 'package:get_it/get_it.dart';

abstract class DependencyInjection {
  static void initialize() {
    Dio dio = Dio(
      BaseOptions(baseUrl: 'https://fakestoreapi.com/'),
    );

    BaseHttpDio baseHttpDio = BaseHttpDio(dio);

    final ProductAPI productAPI = ProductAPI(baseHttpDio);
    GetIt.instance.registerSingleton<ProductAPI>(productAPI);
  }
}
