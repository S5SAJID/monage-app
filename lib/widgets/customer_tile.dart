import 'dart:io';
import 'package:flutter/material.dart';
import '../models/customer.dart';

class CustomerTile extends StatelessWidget {
  final Customer customer;

  const CustomerTile({super.key, required this.customer});

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
        customer.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        semanticsLabel: 'Customer name: ${customer.name}',
      ),
      subtitle: Text(
        '₨ ${customer.unpaidAmount.toStringAsFixed(2)} unpaid',
        style: const TextStyle(fontSize: 14, color: Colors.black54),
        semanticsLabel: 'Unpaid amount: ${customer.unpaidAmount}',
      ),
      trailing: const Icon(Icons.chevron_right, semanticLabel: 'View customer details'),
      onTap: () {
        // TODO: Show customer details
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: Border(bottom: BorderSide(color: Colors.grey[200]!)),
    );
  }
}
