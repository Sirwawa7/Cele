import 'package:flutter/material.dart';

class AddBus extends StatefulWidget {
  @override
  _AddBusState createState() => _AddBusState();
}

class _AddBusState extends State<AddBus> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Form fields
  TextEditingController _busNameController = TextEditingController();
  TextEditingController _busNumberController = TextEditingController();
  TextEditingController _busCapacityController = TextEditingController();
  TextEditingController _ownerNameController = TextEditingController();
  TextEditingController _mtnMomoNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bus'),
        backgroundColor: Color(0xFF00008B), // Navy Blue
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Bus Information Section
              SectionTitle(title: 'Bus Information', color: Color(0xFF00008B)),
              TextFormField(
                controller: _busNameController,
                decoration: InputDecoration(labelText: 'Bus Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bus name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _busNumberController,
                decoration: InputDecoration(labelText: 'Bus Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bus number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _busCapacityController,
                decoration: InputDecoration(labelText: 'Bus Capacity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the bus capacity';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),

              // Payment Information Section
              SectionTitle(title: 'Payment Information', color: Colors.orange),
              TextFormField(
                controller: _ownerNameController,
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _mtnMomoNumberController,
                decoration: InputDecoration(labelText: 'MTN MoMo Cellphone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your MTN MoMo cellphone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Form is valid, perform actions (e.g., payment through MTN MoMo)
                    _submitForm();
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Perform actions here, e.g., initiate payment through MTN MoMo

    // You can access the form values using the controllers:
    String busName = _busNameController.text;
    String busNumber = _busNumberController.text;
    String busCapacity = _busCapacityController.text;
    String ownerName = _ownerNameController.text;
    String mtnMomoNumber = _mtnMomoNumberController.text;

    // Print or use the values as needed
    print('Bus Name: $busName');
    print('Bus Number: $busNumber');
    print('Bus Capacity: $busCapacity');
    print('Owner Name: $ownerName');
    print('MTN MoMo Number: $mtnMomoNumber');

    // Add your logic for initiating payment through MTN MoMo
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;

  SectionTitle({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: color),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddBus(),
  ));
}