import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/order.dart';
import '../models/customer.dart';
import '../providers/order_provider.dart';
import '../providers/customer_provider.dart';
import '../utils/image_storage_helper.dart';

class AddOrderWizard extends StatefulWidget {
  const AddOrderWizard({super.key});

  @override
  State<AddOrderWizard> createState() => _AddOrderWizardState();
}

class _AddOrderWizardState extends State<AddOrderWizard> {
  int _step = 0;
  Customer? _selectedCustomer;
  String _orderName = '';
  double _price = 0.0;
  String? _imagePath;
  bool _isSaving = false;

  void _nextStep() {
    if (_step < 2) setState(() => _step++);
  }

  void _prevStep() {
    if (_step > 0) setState(() => _step--);
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final savedPath = await ImageStorageHelper.saveImage(File(picked.path));
      setState(() {
        _imagePath = savedPath;
      });
    }
  }

  void _saveOrder() async {
    if (_selectedCustomer == null || _orderName.isEmpty || _price <= 0) return;
    setState(() => _isSaving = true);
    final order = Order(
      customerId: _selectedCustomer!.id!,
      name: _orderName,
      price: _price,
      imagePath: _imagePath,
      createdAt: DateTime.now().toIso8601String(),
    );
    await Provider.of<OrderProvider>(context, listen: false).addOrder(order);
    setState(() => _isSaving = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final customers = Provider.of<CustomerProvider>(context).customers;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Order'),
        backgroundColor: Colors.green[700],
      ),
      body: Stepper(
        currentStep: _step,
        onStepContinue: _step == 2 ? _saveOrder : _nextStep,
        onStepCancel: _prevStep,
        controlsBuilder: (context, details) {
          return Row(
            children: [
              if (_step > 0)
                TextButton(onPressed: details.onStepCancel, child: const Text('Back')),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: details.onStepContinue,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
                child: Text(_step == 2 ? 'Save' : 'Next'),
              ),
            ],
          );
        },
        steps: [
          Step(
            title: const Text('Select Customer'),
            content: DropdownButtonFormField<Customer>(
              value: _selectedCustomer,
              items: customers
                  .map((c) => DropdownMenuItem(value: c, child: Text(c.name)))
                  .toList(),
              onChanged: (c) => setState(() => _selectedCustomer = c),
              decoration: const InputDecoration(labelText: 'Customer'),
            ),
            isActive: _step == 0,
          ),
          Step(
            title: const Text('Order Details'),
            content: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Order Name'),
                  onChanged: (val) => _orderName = val,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  onChanged: (val) => _price = double.tryParse(val) ?? 0.0,
                ),
              ],
            ),
            isActive: _step == 1,
          ),
          Step(
            title: const Text('Add Image'),
            content: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
                    child: _imagePath == null ? const Icon(Icons.image, size: 40) : null,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Optional'),
              ],
            ),
            isActive: _step == 2,
          ),
        ],
      ),
    );
  }
}
