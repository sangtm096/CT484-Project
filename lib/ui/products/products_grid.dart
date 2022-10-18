import 'package:flutter/material.dart';

import 'product_grid_title.dart';
import 'products_manager.dart';
import '../../models/product.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavorites;

  const ProductsGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = ProductsManager();

    //Đọc ra danh sách các product sẽ được hiển thị từ ProductsManager
    final products = context.select<ProductsManager, List<Product>>(
      (productsManager) => showFavorites
        ? productsManager.favoriteItems
        : productsManager.items);

      showFavorites ? productsManager.favoriteItems : productsManager.items;
    return GridView.builder(
      padding:  const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductGridTile(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}