import 'package:flutter/material.dart';
import 'package:mindlink_app/bloc/print_bloc.dart';
import 'package:mindlink_app/utils/dynamic_link_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PostWidget extends StatefulWidget {
  final String postId;
  final String postType;
  PostWidget({required this.postId, required this.postType});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
 // text, video, or image
  bool? showButton=false;

 Widget build(BuildContext context) {
  return Column(
    children: [
      IconButton(
        icon: Icon(Icons.share),
        onPressed: () {
          setState(() {
            showButton = true;
          });
        },
      ),
      if (showButton!=false) // Simplified condition
        ElevatedButton(
          child: Text('button'),
          onPressed: () async {
            context.read<PrintBloc>().add(PrintSharingEvent());

            final postLink = await DynamicLinkHandler.instance.createPostLink(
              postId: widget.postId,
              postType: widget.postType,
            );
            Share.share(postLink);
          },
        ),
    ],
  );
}
}
