import 'package:flutter/material.dart';

class EmojiSelectionPage extends StatefulWidget {
  @override
  _EmojiSelectionPageState createState() => _EmojiSelectionPageState();
}

class _EmojiSelectionPageState extends State<EmojiSelectionPage> {
  String selectedMood = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your mood'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select your mood:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                onTap: () {
                  _selectMood('😃 Happy');
                },
                title: Text('Happy'),
              ),
              ListTile(
                onTap: () {
                  _selectMood('😡 Angry');
                },
                title: Text('Angry'),
              ),
              ListTile(
                onTap: () {
                  _selectMood('😢 Sad');
                },
                title: Text('Sad'),
              ),
              // Add more mood options with emojis as needed
            ],
          ),
        ),
      ),
    );
  }

  void _selectMood(String mood) {
    // Save the selected mood and go back to the previous page
    Navigator.pop(context, mood);
  }
}
