import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/customer.dart';
import '../providers/customer_provider.dart';
import '../utils/image_storage_helper.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String? _imagePath;
  bool _isSaving = false;

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

  void _saveCustomer() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    _formKey.currentState!.save();
    final customer = Customer(name: _name, imagePath: _imagePath);
    await Provider.of<CustomerProvider>(context, listen: false).addCustomer(customer);
    setState(() => _isSaving = false);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Customer'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: _imagePath != null ? FileImage(File(_imagePath!)) : null,
                  child: _imagePath == null ? const Icon(Icons.person, size: 40) : null,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (val) => val == null || val.isEmpty ? 'Enter a name' : null,
                onSaved: (val) => _name = val ?? '',
              ),
              const SizedBox(height: 24),
              _isSaving
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _saveCustomer,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green[700]),
                      child: const Text('Save'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
