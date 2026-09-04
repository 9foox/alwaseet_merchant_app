import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<OrdersProvider>(context).orders;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('الطلبات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (ctx, i) {
                final o = orders[i];
                return Card(
                  child: ListTile(
                    title: Text(o.customerName),
                    subtitle: Text('${o.status} • ${o.date.toLocal().toString().split(' ')[0]}'),
                    trailing: Text('${o.total.toStringAsFixed(2)} SAR'),
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
