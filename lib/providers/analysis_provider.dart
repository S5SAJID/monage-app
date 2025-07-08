import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/customer.dart';

class AnalysisProvider with ChangeNotifier {
  double getTotalRevenue(List<Order> orders) {
    return orders.fold(0, (sum, order) => sum + order.price);
  }

  double getAverageOrderValue(List<Order> orders) {
    if (orders.isEmpty) return 0;
    return getTotalRevenue(orders) / orders.length;
  }

  // Add more analytics methods as needed
}
