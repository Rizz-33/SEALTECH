
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/components/theme.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    void openLocationSearchBox(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Your Location'),
          content: TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: "Enter Address..",
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                textController.clear();
              },
              child: Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () {
                String newAddress = textController.text;
                Provider.of<SealTech>(context, listen: false).updateDeliveryAddress(newAddress);
                Navigator.pop(context);
                textController.clear();
              },
              child: Text('Save'),
            ),
            
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deliver Address',
            style: TextStyle(color: primaryColor),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                Consumer<SealTech>(
                  builder: (context, product, child) => Text(
                    product.deliveryAddress,
                    style: TextStyle(
                      color: accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded, color: accentColor,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}