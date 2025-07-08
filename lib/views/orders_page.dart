import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_provider.dart';
import '../providers/customer_provider.dart';
import '../models/order.dart';
import '../models/customer.dart';
import '../widgets/order_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final customerProvider = Provider.of<CustomerProvider>(context);
    final orders = orderProvider.orders;
    final customers = customerProvider.customers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        backgroundColor: Colors.green[700],
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
        elevation: 2,
      ),
      body: orders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.inbox, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text('No orders yet', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text('Tap + to create a new order', style: TextStyle(color: Colors.grey)),
                ],
              ),
            )
          : ListView.separated(
              itemCount: orders.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final order = orders[index];
                final customer = customers.firstWhere(
                  (c) => c.id == order.customerId,
                  orElse: () => Customer(id: null, name: 'Unknown'),
                );
                return OrderTile(order: order, customer: customer);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add order wizard
        },
        backgroundColor: Colors.green[700],
        child: const Icon(Icons.add),
      ),
    );
  }
}
