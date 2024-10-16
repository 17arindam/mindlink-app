import 'package:flutter/material.dart';
import 'package:mindlink_app/screens/text_post.dart';
import 'package:mindlink_app/screens/video_post.dart';
import 'package:mindlink_app/screens/image_post.dart';
import 'package:mindlink_app/utils/dynamic_link_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Provide unique post IDs for each type of post
  final List<Widget> _pages = [
    TextPost(postId: 'textPost_123'),  // Unique postId for TextPost
    VideoPost(postId: 'videoPost_456'), // Unique postId for VideoPost
    ImagePost(postId: 'imagePost_789'), // Unique postId for ImagePost
  ];

  @override
  void initState() {
    super.initState();
    // Initialize dynamic link handler and pass the reference to this state
    DynamicLinkHandler.instance.setHomeScreenState(this);
  }

  // Method to update the BottomNavigationBar index from dynamic link
  void updateCurrentIndex(int index, String postId) {
    setState(() {
      _currentIndex = index;
    });
    
    // Update postId if needed
    switch (index) {
      case 0:
        _pages[0] = TextPost(postId: postId);
        break;
      case 1:
        _pages[1] = VideoPost(postId: postId);
        break;
      case 2:
        _pages[2] = ImagePost(postId: postId);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MindLink Project'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
        ],
      ),
    );
  }
}
