import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:mindlink_app/screens/home_screen.dart'; // Ensure HomeScreen is imported

/// Provides methods to manage dynamic links for posts.
final class DynamicLinkHandler {
  DynamicLinkHandler._();

  static final instance = DynamicLinkHandler._();

  final _appLinks = AppLinks();

  // Reference to the HomeScreen state
  HomeScreenState? _homeScreenState;

  /// Initializes the [DynamicLinkHandler].
  Future<void> initialize() async {
    // * Listens to the dynamic links and manages navigation.
    _appLinks.uriLinkStream.listen(_handleLinkData).onError((error) {
      log('$error', name: 'Dynamic Link Handler');
    });
    _checkInitialLink();
  }

  /// Handle navigation if an initial link is found on app start.
  Future<void> _checkInitialLink() async {
    final initialLink = await _appLinks.getInitialLink();
    if (initialLink != null) {
      _handleLinkData(initialLink);
    }
  }

  /// Set the reference to HomeScreenState so we can interact with it
  void setHomeScreenState(HomeScreenState homeScreenState) {
    _homeScreenState = homeScreenState;
  }

  /// Handles the link navigation for dynamic links.
  void _handleLinkData(Uri data) {
    final queryParams = data.queryParameters;
    log('Received dynamic link: ${data.toString()}', name: 'Dynamic Link Handler');

    final postId = queryParams['postId'];
    final postType = queryParams['postType'];

    if (postId != null && postType != null) {
      log('Navigating to post with ID: $postId and type: $postType', name: 'Dynamic Link Handler');
      
      int targetIndex;
      switch (postType) {
        case 'text':
          targetIndex = 0; // TextPost is at index 0
          break;
        case 'video':
          targetIndex = 1; // VideoPost is at index 1
          break;
        case 'image':
          targetIndex = 2; // ImagePost is at index 2
          break;
        default:
          targetIndex = 0; // Default to TextPost if postType is unknown
          break;
      }

      // Update the bottom navigation index in HomeScreenState
      _homeScreenState?.updateCurrentIndex(targetIndex, postId);
    }
  }

  /// Generates the short URL for your post's dynamic link.
  Future<String> createPostLink({
  required String postId,
  required String postType, // E.g., text, video, or image.
}) async {
  // Use your actual domain and URL pattern here
  print('intent://posts?postId=$postId&postType=$postType#Intent;scheme=yourapp;package=com.example.mindlink_app;end');
  return 'intent://posts?postId=$postId&postType=$postType#Intent;scheme=yourapp;package=com.example.mindlink_app;end';
}
}
