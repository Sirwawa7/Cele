import 'package:flutter/material.dart';

class RemoveBusScreen extends StatefulWidget {
  @override
  _RemoveBusScreenState createState() => _RemoveBusScreenState();
}

class _RemoveBusScreenState extends State<RemoveBusScreen> {
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remove Bus'),
        backgroundColor: Color(0xFF00008B), // Navy Blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bus Information',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color(0xFF00008B)),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _busNameController,
              decoration: InputDecoration(labelText: 'Bus Name'),
            ),
            TextFormField(
              controller: _busNumberController,
              decoration: InputDecoration(labelText: 'Bus Number'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _confirmRemoveBus();
              },
              child: Text('Remove'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmRemoveBus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Removal'),
          content: Text('Are you sure you want to remove this bus?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showRemoveSuccess();
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

  void _showRemoveSuccess() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Removed Successful'),
          content: Text('The bus has been successfully removed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Additional actions after removal success
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
    home: RemoveBusScreen(),
  ));
}
