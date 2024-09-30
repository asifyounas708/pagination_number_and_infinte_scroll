import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_lifecycle/models/product.dart';
import 'package:riverpod_lifecycle/repositories/product_repository.dart';

part 'product_provider.g.dart';

@riverpod
FutureOr<List<Product>> getProducts(GetProductsRef ref, int page) {
  final cancelToken = CancelToken();
  Timer? timer;

  ref.onDispose(() {
    print("getProducts($page) disposed. timer cancelled, token cancelled");
    timer?.cancel();
    cancelToken.cancel();
  });
  ref.onCancel(() {
    print('[getProducts($page) cancelled]');
  });

  ref.onResume(() {
    print('[getProducts($page) resume timer cancelled]');
    timer?.cancel();
  });
  final products = ref.watch(productRepositoryProvider).getProduct(
        page,
      );
  final keepAliveLink = ref.keepAlive();
  ref.onCancel(() {
    print('[getProducts($page) cancelled timer started]');
    timer = Timer(const Duration(seconds: 10), () {
      keepAliveLink.close();
    });
  });

  return products;
}
