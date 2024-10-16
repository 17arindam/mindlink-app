import 'package:flutter/material.dart';
import 'package:mindlink_app/widgets/post_widget.dart';

class ImagePost extends StatelessWidget {
  final String postId;

  ImagePost({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Image.network('https://th.bing.com/th/id/OIP.PGtlsOk5fZnf1agVZ5ah6gHaHc?w=701&h=705&rs=1&pid=ImgDetMain'),
          PostWidget(postId: postId, postType: 'image'),
        ],
      ),
    );
  }
}
