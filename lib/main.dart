import './screens/home_screen.dart';
import 'package:flutter/material.dart';

import './style.dart';
import './widgets/collection_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dutch Learning Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: FontNameDefault,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
              bodyText1: BodyOneTextStyle, headline1: TitleTextStyle)),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ("/"):
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case ("/collection_details"):
        return MaterialPageRoute(
            builder: (_) => CollectionDetails(
                  collectionId: args,
                ));
      default:
        return MaterialPageRoute(builder: (context) => HomeScreen());
    }
  }
}
