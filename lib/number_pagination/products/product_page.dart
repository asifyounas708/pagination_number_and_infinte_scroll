import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:riverpod_lifecycle/number_pagination/product/product_detail.dart';
import 'package:riverpod_lifecycle/number_pagination/products/product_provider.dart';
import 'package:riverpod_lifecycle/number_pagination/repositories/product_repository.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({super.key});

  @override
  ConsumerState<ProductPage> createState() => _ProductPageState();
}

int page = 1;

class _ProductPageState extends ConsumerState<ProductPage> {
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(getProductsProvider(page));
    // print(products);
    return Scaffold(
      body: products.when(
        data: (products) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final product = products[index];
              print(product);
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SingleProductPage(productId: product.id),
                    ),
                  );
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(product.thumbnail),
                ),
                title: Text(product.title),
                subtitle: Text(product.brand),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemCount: products.length,
          );
        },
        error: (e, st) {
          return Center(
              child: Text(
            st.toString(),
            textAlign: TextAlign.center,
          ));
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: totalProducts == 0 && totalPages == 1
          ? const SizedBox.shrink()
          : Card(
              margin: const EdgeInsets.only(bottom: 20),
              elevation: 4,
              child: NumberPaginator(
                numberPages: totalPages,
                onPageChange: (int index) {
                  setState(() {
                    page = index + 1;
                  });
                },
              ),
            ),
    );
  }
}
