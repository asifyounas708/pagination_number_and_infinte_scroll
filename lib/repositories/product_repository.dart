import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_lifecycle/models/product.dart';
import 'package:riverpod_lifecycle/repositories/dio_provioder.dart';

part 'product_repository.g.dart';

const limit = 20;

class ProductRepository {
  final Dio dio;

  ProductRepository({required this.dio});

  Future<List<Product>> getProduct(
    int page,
  ) async {
    try {
      final response = await dio.get(
        "/products",
        queryParameters: {
          'limit': limit,
          'skip': (page - 1) * limit,
        },
      );
      if (response.statusCode == 200) {
        final List productList = response.data['products'];

        final products = [
          for (final product in productList) Product.fromJson(product)
        ];
        return products;
      } else {
        throw "Failed to fetch Product";
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getSingleProduct(int productId) async {
    try {
      final response = await dio.get("/products/$productId");
      if (response.statusCode == 200) {
        final product = Product.fromJson(response.data);
        return product;
      } else {
        throw "Failed to Fetch Signle Product $productId";
      }
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepository(dio: ref.watch(dioProvider));
}
