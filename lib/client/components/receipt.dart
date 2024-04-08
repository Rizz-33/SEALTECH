import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sealtech/client/models/product.dart';
import 'package:sealtech/components/theme.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({Key? key});

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();
    DateTime estimatedDeliveryTime = currentTime.add(Duration(minutes: 15));

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Thank you for your order !", style: TextStyle(color: primaryColor),),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primary50,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(25),
                child: Consumer<SealTech>(
                  builder: (context, product, child) =>
                      Text(product.displayCartReceipt()),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Estimated delivery time is: ${estimatedDeliveryTime.hour}:${estimatedDeliveryTime.minute}",
              ),
              SizedBox(height: 25,),
              Text('SEALTECH Waterproofing Company\n345,Colombo\n+94 11 124 4832', textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}