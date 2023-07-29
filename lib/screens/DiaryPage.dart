import 'package:flutter/material.dart';
import 'package:companion_app_main/screens/home/SelectEmoji.dart';
import 'package:companion_app_main/screens/home/WritingPage.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  String selectedMood = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary'),
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
                'How was your day?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Change font color to black
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.35, // Adjust height of the card
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-vector/colorful-emoji-set-design_79603-1263.jpg?w=900&t=st=1689959583~exp=1689960183~hmac=8790764fa34e8b1480b5fcc0373e4686111afcfe99c91cec7346290c070fbaac'), // Replace with the mood selection image URL
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    _showMoodSelection(context);
                  },
                  title: Text(
                    selectedMood.isEmpty ? 'Select your mood' : 'You are feeling $selectedMood',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.35, // Adjust height of the card
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/premium-vector/cute-cartoon-notepad-pen-realistic-3d-school-object-vector-illustration_302982-2364.jpg?w=900'), // Replace with the writing card image URL
                    fit: BoxFit.cover,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    _showWritingArea(context);
                  },
                  title: Text(
                    'Write about your day',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add code to save the diary entry
                  Navigator.pop(context); // Go back to the home page
                },
                child: Text('Save Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoodSelection(BuildContext context) async {
    final selectedEmoji = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmojiSelectionPage()),
    );

    if (selectedEmoji != null) {
      setState(() {
        selectedMood = selectedEmoji;
      });
    }
  }

  void _showWritingArea(BuildContext context) async {
    final diaryEntry = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WritingPage()),
    );

    if (diaryEntry != null) {
      // Handle the diary entry as needed
    }
  }
}
