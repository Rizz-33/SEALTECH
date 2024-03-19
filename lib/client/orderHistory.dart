import 'package:flutter/material.dart';
import 'package:sealtech/components/theme.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  //backend
  List<Map<String, dynamic>> _orders = [
    {'id': '1', 'date': '2022-01-01', 'total': 100.0},
    {'id': '2', 'date': '2022-01-02', 'total': 200.0},
    {'id': '3', 'date': '2022-01-03', 'total': 300.0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _orders.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Order ID: ${_orders[index]['id']}'),
              subtitle: Text('Date: ${_orders[index]['date']}'),
              trailing: Text(
                'Total: \$${_orders[index]['total']}',
                style: TextStyle(color: accentColor),
              ),
            );
          },
        ),
      ),
    );
  }
}