import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/customer_provider.dart';
import 'providers/order_provider.dart';
import 'themes/app_theme.dart';
import 'views/orders_page.dart';
import 'views/customers_page.dart';
import 'views/analysis_page.dart';

void main() {
  runApp(const MonageApp());
}

class MonageApp extends StatelessWidget {
  const MonageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: MaterialApp(
        title: 'Monage',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const _MainTabView(),
      ),
    );
  }
}

class _MainTabView extends StatefulWidget {
  const _MainTabView({super.key});

  @override
  State<_MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<_MainTabView> {
  int _currentIndex = 0;
  final _pages = [
    const OrdersPage(),
    const CustomersPage(),
    const AnalysisPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.green[700],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Customers'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analysis'),
        ],
      ),
    );
  }
}
