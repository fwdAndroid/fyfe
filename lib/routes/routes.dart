import 'package:flutter/material.dart';
import 'package:fyfe/screens/property/add_property.dart';
import 'package:fyfe/utils/addresspage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/addProperty':
        return MaterialPageRoute(builder: (_) => AddProperty());
      case '/addressPage':
        // Validation of correct data type

        return MaterialPageRoute(
          builder: (_) => AddressPage(),
        );

      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
