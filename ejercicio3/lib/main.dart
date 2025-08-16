import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleDarkMode(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toggle Dark Mode Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        body: Center(
          child: ToggleControlsWidget(
            isDarkMode: isDarkMode,
            onDarkModeChanged: toggleDarkMode,
          ),
        ),
      ),
    );
  }
}

class ToggleControlsWidget extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onDarkModeChanged;

  const ToggleControlsWidget({
    super.key,
    required this.isDarkMode,
    required this.onDarkModeChanged,
  });

  @override
  State<ToggleControlsWidget> createState() => _ToggleControlsWidgetState();
}

class _ToggleControlsWidgetState extends State<ToggleControlsWidget> {
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    String statusText =
        (widget.isDarkMode && agreedToTerms) ? "Ready" : "Incomplete";

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            key: const Key('darkModeSwitch'),
            title: const Text('Dark Mode'),
            value: widget.isDarkMode,
            onChanged: widget.onDarkModeChanged,
          ),
          CheckboxListTile(
            key: const Key('termsCheckbox'),
            title: const Text('Agree to Terms'),
            value: agreedToTerms,
            onChanged: (value) {
              setState(() {
                agreedToTerms = value ?? false;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            statusText,
            key: const Key('statusText'),
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
