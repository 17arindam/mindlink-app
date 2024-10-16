import 'package:flutter/material.dart';
import 'package:mindlink_app/widgets/post_widget.dart';

class TextPost extends StatelessWidget {
  final String postId;

  TextPost({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Text("This is a sample text post."),
          PostWidget(postId: postId, postType: 'text'),
        ],
      ),
    );
  }
}
