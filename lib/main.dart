import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindlink_app/bloc/print_bloc.dart';
import 'package:mindlink_app/screens/home_screen.dart';
import 'package:mindlink_app/utils/dynamic_link_handler.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DynamicLinkHandler.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrintBloc(),  // Initialize your PrintBloc here
      child: MaterialApp(
        title: 'Flutter Dynamic Links App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
