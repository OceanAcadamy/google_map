import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  sendMail() {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'brindaspringnet@gmail.com',
        queryParameters: {'subject': 'Example Subject & Symbols are allowed!'});

    launch(_emailLaunchUri.toString().replaceAll("+", "%20"));
  }

  launchMap({String lat = "47.6", String long = "-122.3"}) async {
    var mapSchema = 'geo:$lat,$long';
    if (await canLaunch(mapSchema)) {
      await launch(mapSchema);
    } else {
      throw 'Could not launch $mapSchema';
    }
  }

  makeCall() async {
    bool res = await FlutterPhoneDirectCaller.callNumber("08870865905");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OA Puducherry"),
        ),
        body: Row(
          children: [
            RaisedButton(
              child: Text("Google Map"),
              onPressed: () {
                //launchMap(lat: "11.952334721862425", long: "79.83079721795437");
                MapsLauncher.launchQuery('ocean academy puducherry');
              },
              color: Colors.blue,
            ),
            SizedBox(
              width: 10.0,
            ),
            RaisedButton(
              child: Text("Send Mail"),
              onPressed: sendMail,
              color: Colors.blue,
            ),
            SizedBox(
              width: 10.0,
            ),
            RaisedButton(
              child: Text("Make Call"),
              onPressed: makeCall,
              color: Colors.blue,
            )
          ],
        ));
  }
}
