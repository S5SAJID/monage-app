import 'dart:io';
import 'package:flutter/material.dart';
import '../models/order.dart';
import '../models/customer.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final Customer customer;

  const OrderTile({super.key, required this.order, required this.customer});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: customer.imagePath != null
          ? CircleAvatar(
              backgroundImage: FileImage(File(customer.imagePath!)),
              radius: 24,
              foregroundImage: FileImage(File(customer.imagePath!)),
              child: Semantics(
                label: 'Customer profile image',
                child: const SizedBox.shrink(),
              ),
            )
          : CircleAvatar(
              child: Text(customer.name[0]),
              radius: 24,
              foregroundColor: Colors.white,
              backgroundColor: Colors.green[700],
              semanticsLabel: 'Customer initial',
            ),
      title: Text(
        order.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        semanticsLabel: 'Order name: ${order.name}',
      ),
      subtitle: Text(
        customer.name,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
        semanticsLabel: 'Customer: ${customer.name}',
      ),
      trailing: Text(
        '₨ ${order.price.toStringAsFixed(2)}',
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        semanticsLabel: 'Order price: ${order.price}',
      ),
      onTap: () {
        // TODO: Show order details
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: Border(bottom: BorderSide(color: Colors.grey[200]!)),
    );
  }
}
