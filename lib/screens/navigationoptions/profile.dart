import 'package:collegenews/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers for editable fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _collegeIdController = TextEditingController();
  final TextEditingController _batchController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with default values
    _nameController.text = 'katherin jordy';
    _phoneNumberController.text = '123-456-7890';
    _emailController.text = 'beautykat@example.com';
    _collegeIdController.text = 'SCS/1234/2021';
    _batchController.text = '2021';
    _departmentController.text = 'Computer Science';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue, // Set app bar color to blue
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ); // Navigate back
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/girl-profile.png'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white),
                    onPressed: () {
                      // Handle the camera icon press (for changing the photo)
                      // You can open a bottom sheet, modal, or navigate to a new page.
                      // For simplicity, I'm just printing a message.
                      print('Change Photo');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            _buildEditableRow('Name', _nameController, Icons.person),
            const SizedBox(height: 10),
            _buildEditableRow(
                'Phone Number', _phoneNumberController, Icons.phone),
            const SizedBox(height: 10),
            _buildEditableRow('Email', _emailController, Icons.mail),
            const SizedBox(height: 10),
            _buildEditableRow('College ID', _collegeIdController, Icons.school),
            const SizedBox(height: 10),
            _buildEditableRow('Batch', _batchController, Icons.date_range),
            const SizedBox(height: 10),
            _buildEditableRow('Department', _departmentController, Icons.work),
            const SizedBox(height: 32.0),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableRow(
      String label, TextEditingController controller, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(width: 8.0),
            Text(
              label,
              style: const TextStyle(fontSize: 16.0, color: Colors.black87),
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.edit,
                  color: Colors.blue), // Change edit icon color to blue
              onPressed: () {
                _showEditDialog(context, label, controller);
              },
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: controller,
          style: const TextStyle(fontSize: 16.0, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity, // Make the button take the full width
      child: ElevatedButton(
        onPressed: () {
          // Handle the submit button press
          // You can update the caregiver's information in the database or perform other actions.
          print('Submit Button Pressed');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue, // Light blue background color
        ),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _showEditDialog(
      BuildContext context, String label, TextEditingController controller) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $label'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                // Save logic goes here
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
