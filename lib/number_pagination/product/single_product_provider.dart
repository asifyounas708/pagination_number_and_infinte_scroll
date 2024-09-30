import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_lifecycle/models/product.dart';
import 'package:riverpod_lifecycle/repositories/product_repository.dart';

part 'single_product_provider.g.dart';

@riverpod
FutureOr<Product> getSingleProduct(GetSingleProductRef ref, int productId) {
  return ref.watch(productRepositoryProvider).getSingleProduct(productId);
}
