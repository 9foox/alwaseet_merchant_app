import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context).products;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('المنتجات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (ctx, i) {
                final p = products[i];
                return Card(
                  child: ListTile(
                    leading: Image.network(p.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                    title: Text(p.name),
                    subtitle: Text('${p.category} • ${p.quantity} قطعة'),
                    trailing: Text('${p.price.toStringAsFixed(2)} SAR'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
