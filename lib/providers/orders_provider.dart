import 'package:flutter/material.dart';

class Order {
  final String id;
  final String customerName;
  final double total;
  String status; // e.g., 'pending', 'processing', 'completed'
  final DateTime date;

  Order({
    required this.id,
    required this.customerName,
    required this.total,
    required this.status,
    required this.date,
  });
}

class OrdersProvider extends ChangeNotifier {
  final List<Order> _orders = [
    Order(
      id: 'o1',
      customerName: 'عميل تجريبي',
      total: 150.0,
      status: 'pending',
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  List<Order> get orders => List.unmodifiable(_orders);

  void addOrder(Order order) {
    _orders.insert(0, order);
    notifyListeners();
  }

  void updateOrderStatus(String id, String status) {
    final index = _orders.indexWhere((o) => o.id == id);
    if (index != -1) {
      _orders[index].status = status;
      notifyListeners();
    }
  }

  void removeOrder(String id) {
    _orders.removeWhere((o) => o.id == id);
    notifyListeners();
  }
}
