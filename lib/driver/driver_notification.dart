import 'package:flutter/material.dart';

class Driver_NotificationScreen extends StatelessWidget {
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
            title: 'New Booking:',
            message: 'New booking received. Pickup at Mbabane for Manzini.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Passenger Pickup Reminder:',
            message: 'Reminder: Pickup for [Booking ID: 000003] in 15 minutes at Matsapha.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Route Change:',
            message: 'Route change: Detour required due to road closure. Follow new route instructions.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Service Feedback:',
            message: 'New passenger feedback received. Check your feedback section for details.',
            color: Colors.orange,
          ),
          NotificationItem(
            title: 'Weather Advisory:',
            message: 'Weather advisory: Heavy rain expected. Drive safely and adjust speed accordingly.',
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
    home: Driver_NotificationScreen(),
  ));
}
