import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_lifecycle/models/product.dart';
import 'package:riverpod_lifecycle/repositories/product_repository.dart';

class InfiniteProductScroll extends ConsumerStatefulWidget {
  const InfiniteProductScroll({super.key});

  @override
  ConsumerState<InfiniteProductScroll> createState() =>
      _InfiniteProductScrollState();
}

// int page = 1;

class _InfiniteProductScrollState extends ConsumerState<InfiniteProductScroll> {
  final PagingController<int, Product> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchProducts(pageKey);
    });
    super.initState();
  }

  _fetchProducts(int pageKey) async {
    try {
      final newProduct =
          await ref.read(productRepositoryProvider).getProduct(pageKey);
      final isLastPage = newProduct.length < limit;
      if (isLastPage) {
        _pagingController.appendLastPage(newProduct);
      } else {
        final newPagekey = pageKey + 1;
        _pagingController.appendPage(newProduct, newPagekey);
      }
    } catch (e) {
      _pagingController.error = e;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(products);
    return Scaffold(
        body: RefreshIndicator(
      onRefresh: () async => _pagingController.refresh(),
      child: PagedListView<int, Product>.separated(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate(
            itemBuilder: (context, product, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(product.thumbnail),
                ),
                title: Text(product.title),
                subtitle: Text(product.brand),
                trailing: CircleAvatar(
                    radius: 15,
                    child: Text(
                      product.id.toString(),
                      style: const TextStyle(fontSize: 12),
                    )),
              );
            },
            noMoreItemsIndicatorBuilder: (context) => const Center(
              child: Text("No More Items"),
            ),
          ),
          separatorBuilder: (context, index) {
            return const Divider();
          }),
    ));
  }
}
