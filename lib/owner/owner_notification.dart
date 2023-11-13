import 'package:flutter/material.dart';

class OwnerNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color(0xFF00008B), // Navy Blue
      ),
      body: ListView(
        children: [
          NotificationItem(
            title: 'New Booking',
            message: 'You have a new booking for Bus ABC.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Payment Received',
            message: 'Payment of E500.00 received for Bus XYZ.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Bus Maintenance Reminder',
            message: 'Bus ABC is due for maintenance soon.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Account Update',
            message: 'Your account information has been updated.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'New Booking',
            message: 'You have a new booking for Bus ABC.',
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;
  final Color color;

  NotificationItem({required this.title, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              message,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OwnerNotificationScreen(),
  ));
}
