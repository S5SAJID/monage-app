import 'package:flutter/material.dart';
import '../models/order.dart';
import '../utils/db_helper.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  final DBHelper _dbHelper = DBHelper();

  List<Order> get orders => _orders;

  Future<void> fetchOrders() async {
    // Implement DB fetch logic
    // _orders = await _dbHelper.getOrders();
    notifyListeners();
  }

  Future<void> addOrder(Order order) async {
    // Implement DB insert logic
    // final id = await _dbHelper.insertOrder(order);
    // _orders.add(order.copyWith(id: id));
    notifyListeners();
  }

  void updateOrder(int orderId, Order updatedOrder) {
    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index != -1) {
      _orders[index] = updatedOrder;
      notifyListeners();
    }
  }

  void deleteOrder(int orderId) {
    _orders.removeWhere((o) => o.id == orderId);
    notifyListeners();
  }

  // Add any additional methods as needed
}
