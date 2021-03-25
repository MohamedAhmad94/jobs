import 'package:flutter/material.dart';
import 'package:jobs/models/jobs/jobcontroller.dart';
import 'package:provider/provider.dart';
import 'package:jobs/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.debugCheckInvalidValueType = null;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JobController>(create: (_) => JobController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
