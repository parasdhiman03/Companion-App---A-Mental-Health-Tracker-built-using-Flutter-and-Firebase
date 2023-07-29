import 'package:companion_app_main/models/udata.dart';
import 'package:companion_app_main/quiz/quiz_screen.dart';
import 'package:companion_app_main/screens/home/pro_help.dart';
import 'package:companion_app_main/screens/home/setting_form.dart';
import 'package:flutter/cupertino.dart';
import 'fitness_page.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:companion_app_main/services/auth.dart';
import 'package:companion_app_main/services/database.dart';
import 'package:companion_app_main/screens/home/udata_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:companion_app_main/models/auser.dart';
import 'package:companion_app_main/screens/home/udata_page.dart';
import 'package:companion_app_main/quiz/quiz_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:companion_app_main/screens/DiaryPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'yoy.dart';
import 'user_dash.dart';
import 'about_page.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final AuthService _auth = AuthService();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this); // Set the length to 1
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showProfilePanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: SettingForm(),
      );
    });
  }

  void _showUdataPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UdataPage()), // Navigate to UdataPage
    );
  }

  void doMeditation() async {
    const youtubeVideoUrl = 'https://youtu.be/CDnEKUDNwMM';
    if (await canLaunch(youtubeVideoUrl)) {
      await launch(youtubeVideoUrl);
    } else {
      print('Could not launch $youtubeVideoUrl');
    }
  }


  void writeToDoDiary() {
    // Add code to open the to-do diary page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DiaryPage()),
    );
  }

  void listenToMusic() async {
    // YouTube Music URL
    const youtubeMusicUrl = 'https://music.youtube.com/'; // YouTube Music URL
    // Spotify URL
    const spotifyUrl = 'https://open.spotify.com/'; // Spotify URL

    // Check if YouTube Music app is installed
    if (await canLaunch(youtubeMusicUrl)) {
      await launch(youtubeMusicUrl);
    } else {
      // If YouTube Music app is not installed, try opening in a web browser
      if (await canLaunch(spotifyUrl)) {
        await launch(spotifyUrl);
      } else {
        // If neither app is installed, handle the error
        print('Neither YouTube Music nor Spotify app is installed.');
      }
    }
  }

  void _showAboutPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage()), // Navigate to the AboutPage
    );
  }





  @override
  Widget build(BuildContext context) {
    final Auser? currentUser = Provider.of<Auser?>(context);
    final String uid = currentUser?.uid ?? '';

    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: Text('Companion App'),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.exit_to_app),
            label: Text('Logout'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tasks'),
            // Remove the second tab
          ],
        ),

      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text(
                'Mental Health App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Edit Profile'),
              onTap: () => _showProfilePanel(),
            ),
            ListTile(
              title: Text('👤            User Dashboard'),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDashboard(
                      name: 'Paras Dhiman',
                      age: 19,
                      profession: 'Engineer',
                      mood: 'Sad',
                      quizScore: 4,
                    ),
                  ),
                );

              }
            ),
            ListTile(
              title: Text('👨‍⚕️          Professional Help'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessionalHelpPage()),
                );
              },
            ),
            ListTile(
              title: Text('⚠️             About'),
              onTap: () => _showAboutPage(),
            ),
            // Add more ListTile widgets for additional items
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/blur-pink-blue-abstract-gradient-background-vector_53876-174836.jpg?w=360&t=st=1689808163~exp=1689808763~hmac=a4fec308281a82afc0e11422eeaf5649a0758c2ceca57dc46f7efe37c18e1391'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: doMeditation,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://img.freepik.com/free-vector/silhouette-female-with-chakra-yoga-pose-against-starry-night-sky_1048-13073.jpg?w=826&t=st=1689809119~exp=1689809719~hmac=6cbaaaa787510b22f02a7585a84dac49f7c9388e492aab462a725b11da019d70'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text('Meditation',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: writeToDoDiary,
                    child: Hero(
                      tag: 'diaryCard', // Unique tag for the Hero animation
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  'https://img.freepik.com/free-photo/notepad-with-pen-dark-background_181624-182.jpg?w=900&t=st=1689811968~exp=1689812568~hmac=74c6f131646cb6d20be36d3ca95c8456fffea894cbfa8e7aa6261f7e4b582cf9'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Diary',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: listenToMusic,
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://img.freepik.com/free-photo/caucasian-woman-s-portrait-isolated-blue-background-multicolored-neon-light_155003-32526.jpg?w=900&t=st=1689809949~exp=1689810549~hmac=6547412b168186c3347a5cd8869e48ed130d88579f6624557c26ddf5acff8627'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Text('Music App',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.deepPurple,
        onTap: (index) {
          if (index == 0) {
            // Handle Home option tap (if needed)
          } else if (index == 1) {
            _showUdataPage(); // Navigate to the view data page
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QuizScreen()), // Navigate to the quiz assessment page
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FitnessPage()), // Navigate to the fitness page
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center), // Add the icon for the Fitness Tracker
            label: 'Fitness',
          ),
        ],
      ),

      // User Dashboard

    );
  }
}

