import 'package:flutter/material.dart';
import '../models/customer.dart';
import '../utils/db_helper.dart';

class CustomerProvider with ChangeNotifier {
  List<Customer> _customers = [];
  final DBHelper _dbHelper = DBHelper();

  List<Customer> get customers => _customers;

  Future<void> fetchCustomers() async {
    // Implement DB fetch logic
    // _customers = await _dbHelper.getCustomers();
    notifyListeners();
  }

  Future<void> addCustomer(Customer customer) async {
    // Implement DB insert logic
    // final id = await _dbHelper.insertCustomer(customer);
    // _customers.add(customer.copyWith(id: id));
    notifyListeners();
  }

  void updateUnpaidAmount(int customerId, double amount) {
    final index = _customers.indexWhere((c) => c.id == customerId);
    if (index != -1) {
      _customers[index].unpaidAmount = amount;
      notifyListeners();
    }
  }

  // Add update and delete methods as needed
}
