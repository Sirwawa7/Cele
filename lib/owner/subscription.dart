import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  final TextEditingController _mtnMoMoNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Subscription'),
        backgroundColor: Color(0xFF00008B), // Navy Blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Subscription Details',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF00008B)),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _mtnMoMoNumberController,
              decoration: InputDecoration(labelText: 'MTN MoMo Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _confirmPayment(context);
              },
              child: Text('Pay E250.00'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmPayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Payment'),
          content: Text('Are you sure you want to pay E250.00 for the monthly subscription?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showPaymentSuccess(context);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _showPaymentSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('The monthly subscription payment of E250.00 was successful.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigate back to the OwnerScreen after successful payment
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SubscriptionScreen(),
  ));
}
