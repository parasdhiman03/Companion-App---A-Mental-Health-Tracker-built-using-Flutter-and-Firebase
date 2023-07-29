import 'package:flutter/material.dart';
import 'package:companion_app_main/models/udata.dart';

class UserDashboard extends StatelessWidget {
  final String name;
  final int age;
  final String profession;
  final String mood;
  final int quizScore;

  UserDashboard({
    required this.name,
    required this.age,
    required this.profession,
    required this.mood,
    required this.quizScore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.freepik.com/free-vector/blue-fluid-background-frame_53876-99019.jpg?w=360&t=st=1690017049~exp=1690017649~hmac=15b12fe6e70608301d03c7884359a01e80c4ce5afdaa623dab35b0ea592d9fea'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Profile Picture
                Container(
                  margin: EdgeInsets.all(20),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://img.freepik.com/premium-vector/young-smiling-man-adam-avatar-3d-vector-people-character-illustration-cartoon-minimal-style_365941-687.jpg?w=740'), // Add your image path here
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // User Information Cards
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Name: $name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Age: $age',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Profession: $profession',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Mood: $mood',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Quiz Score
                Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Quiz Score: $quizScore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
