import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_lifecycle/number_pagination/product/single_product_provider.dart';

class SingleProductPage extends ConsumerWidget {
  final int productId;
  const SingleProductPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(getSingleProductProvider(productId));
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product",
          ),
        ),
        body: product.when(
            data: (product) {
              return Column(
                children: [
                  Text(product.title),
                  const Divider(),
                  BulletedList(
                    bullet: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    listItems: [
                      "Brand : ${product.brand}",
                      "Category : ${product.category}",
                      "Price : \$${product.price}",
                      "Discounted(%) : ${product.discountPercentage}",
                      "Rating : ${product.rating}",
                      "Stock : ${product.stock}",
                      "Description : ${product.description}",
                    ],
                  ),
                  const Divider(),
                  SizedBox(
                    width: double.infinity,
                    height: 250,
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
            error: (e, st) {
              return Center(child: Text(e.toString()));
            },
            loading: () => Center(child: CircularProgressIndicator())));
  }
}
