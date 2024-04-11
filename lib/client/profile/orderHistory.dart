import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  List<Map<String, dynamic>> _orders = [
    {'id': '1', 'date': '2022-01-01', 'total': 100.0},
    {'id': '2', 'date': '2022-01-02', 'total': 200.0},
    {'id': '9076', 'date': '2024-04-11', 'total': 30300.0},
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mostRecentOrder = _orders.isNotEmpty ? _orders.last : {};

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: SingleChildScrollView(
        child: ListTile(
          title: Text('Order ID: ${mostRecentOrder['id']}'),
          subtitle: Text('Date: ${mostRecentOrder['date']}'),
          trailing: Text(
            'Total: ${mostRecentOrder['total']} LKR',
            style: TextStyle(color: accentColor),
          ),
        ),
      ),
    );
  }
}