import 'package:flutter/material.dart';
import 'package:mindlink_app/utils/dynamic_link_handler.dart';
import 'package:share_plus/share_plus.dart';

class PostWidget extends StatelessWidget {
  final String postId;
  final String postType; // text, video, or image

  PostWidget({required this.postId, required this.postType});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.share),
      onPressed: () async {
        final postLink = await DynamicLinkHandler.instance.createPostLink(
          postId: postId,
          postType: postType,
        );
        Share.share(postLink);
      },
    );
  }
}
