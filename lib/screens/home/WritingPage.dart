import 'package:flutter/material.dart';

class WritingPage extends StatefulWidget {
  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  String diaryText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write about your day'),
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
                'Write about your day:',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                onChanged: (value) {
                  setState(() {
                    diaryText = value;
                  });
                },
                maxLines: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Write here...',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Save the diary entry and go back to the previous page
                  Navigator.pop(context, diaryText);
                },
                child: Text('Save Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
