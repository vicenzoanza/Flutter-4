import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MiniFormWidget(),
        ),
      ),
    );
  }
}

class MiniFormWidget extends StatefulWidget {
  const MiniFormWidget({super.key});

  @override
  State<MiniFormWidget> createState() => _MiniFormWidgetState();
}

class _MiniFormWidgetState extends State<MiniFormWidget> {
  final TextEditingController _nameController = TextEditingController();
  bool _agreedToTerms = false;

  void _submitForm() {
    if (_nameController.text.isNotEmpty && _agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all fields.')),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            key: const Key('nameField'),
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          CheckboxListTile(
            key: const Key('formCheckbox'),
            title: const Text('Agree to Terms'),
            value: _agreedToTerms,
            onChanged: (value) {
              setState(() {
                _agreedToTerms = value ?? false;
              });
            },
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            key: const Key('submitButton'),
            onPressed: _submitForm,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
