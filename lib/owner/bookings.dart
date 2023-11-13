import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Management'),
        backgroundColor: Color(0xFF00008B), // Navy Blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _showDiscountDialog(context);
              },
              child: Text('Give Discount'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _communicateWithDriver(context);
              },
              child: Text('Communicate with Driver'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _removeCustomer(context);
              },
              child: Text('Remove Customer'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _getMonthlyReport(context);
              },
              child: Text('Get Monthly Report'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDiscountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Give Discount'),
          content: TextFormField(
            decoration: InputDecoration(labelText: 'Discount Amount'),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add logic to apply discount
              },
              child: Text('Apply'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _communicateWithDriver(BuildContext context) {
    // Add logic to communicate with the driver
    // This can be through a chat screen or another communication method
    // For demonstration purposes, a simple snackbar is shown
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Communicating with Driver...'),
      ),
    );
  }

  void _removeCustomer(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Customer'),
          content: Text('Are you sure you want to remove this customer?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Add logic to remove customer
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

  void _getMonthlyReport(BuildContext context) {
    // Add logic to generate and display the monthly report
    // For demonstration purposes, a simple snackbar is shown
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Generating Monthly Report...'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BookingScreen(),
  ));
}