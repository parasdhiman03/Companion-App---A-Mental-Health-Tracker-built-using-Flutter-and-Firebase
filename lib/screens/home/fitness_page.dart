import 'package:url_launcher/url_launcher.dart'; // For opening the YouTube video
import 'dart:async'; // For the timer
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../quiz/quiz_screen.dart';
import 'home.dart';
class FitnessPage extends StatelessWidget {
  // Timer
  void _startTimer(BuildContext context, int duration) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Timer'),
        content: Text('You will run for ${duration ~/ 60} minutes.'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _watchRunningVideo();
            },
            child: Text('Start'),
          ),
        ],
      ),
    );
  }

  // YouTube Video - Running
  void _watchRunningVideo() async {
    const runningVideoUrl = 'https://www.online-stopwatch.com/full-screen-stopwatch/?ns=1&nslen=3';
    if (await canLaunch(runningVideoUrl)) {
      await launch(runningVideoUrl);
    } else {
      print('Could not launch $runningVideoUrl');
      // Handle the error if the link cannot be opened
    }
  }


  // YouTube Video
  void _watchExerciseVideo() async {
    const youtubeVideoUrl = 'https://youtu.be/GNWaWJm1A1g';
    if (await canLaunch(youtubeVideoUrl)) {
      await launch(youtubeVideoUrl);
    } else {
      print('Could not launch $youtubeVideoUrl');
    }
  }

  // Map
  void _navigateToTrendingArticles(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TrendingArticlesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Tracker'),
      ),
      body: Container(
        color: Colors.blue, // Set background color to blue
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Running Card
              GestureDetector(
                onTap: () => _startTimer(context, 5 * 60),
                // 5 minutes timer for running
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Container(
                    height: 200,
                    width: 400, // Adjust the width of the card
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.unsplash.com/photo-1502224562085-639556652f33?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cnVufGVufDB8fDB8fHww&w=1000&q=80'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Running',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Exercising Card
              GestureDetector(
                onTap: () => _watchExerciseVideo(),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Container(
                    height: 200,
                    width: 400, // Adjust the width of the card
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Exercising',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Meet New People Card
              GestureDetector(
                onTap: () => _navigateToTrendingArticles(context),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Container(
                    height: 180,
                    width: 400, // Adjust the width of the card
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.mentor.se/wp-content/uploads/sites/5/2023/02/01215525/NEW-News-article-featured-image-9.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Trending Articles',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.deepPurple,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()), // Navigate to the fitness page
            );
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
    );
  }
}

void _showUdataPage() {
}

class TrendingArticlesPage extends StatelessWidget {
  // Sample list of articles
  final List<Article> articles = [
    Article(
      profileImageUrl: 'https://www.sfspca.org/wp-content/uploads/2023/05/san-francisco-spca-meet-a-dog2.jpg', // Replace with the actual profile image URL
      title: 'Dogs have a magic effect: how pets can improve our mental health',
      description: 'Canine companions trigger similar neural pathways to the parent baby bond and reduce loneliness and depression ',
    ),
    Article(
      profileImageUrl: 'https://c0.wallpaperflare.com/preview/934/801/70/youth-active-jump-happy.jpg',
      title: 'Young people mental health is finally getting the attention it needs' ,
      description: 'The Covid 19 pandemic and a UNICEF report all highlight the need for prevention and treatment of youth anxiety ',
    ),
    Article(
      profileImageUrl: 'https://img.etimg.com/thumb/msid-86802054,width-650,height-488,imgsize-48746,,resizemode-75/depresssion_think.jpg',
      title: 'How depression and anxiety affects your body ' ,
      description: 'Depression and anxiety are mental health disorders that can have significant effects on the body. Both conditions are complex and can manifest in various ways, impacting physical health and overall well-being. ',
    ),

    // Add more articles here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Articles'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ArticleCard(
            profileImageUrl: articles[index].profileImageUrl,
            title: articles[index].title,
            description: articles[index].description,
            onTap: () {
              // Implement the article details page navigation here if needed
            },
          );
        },
      ),
    );
  }
}

class Article {
  final String profileImageUrl;
  final String title;
  final String description;

  Article({
    required this.profileImageUrl,
    required this.title,
    required this.description,
  });
}

class ArticleCard extends StatelessWidget {
  final String profileImageUrl;
  final String title;
  final String description;
  final VoidCallback onTap;

  const ArticleCard({
    required this.profileImageUrl,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                profileImageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
