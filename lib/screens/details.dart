import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jobs/models/jobs/jobcontroller.dart';

class Detailes extends StatefulWidget {
  @override
  _DetailesState createState() => _DetailesState();
}

class _DetailesState extends State<Detailes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Job Detailes",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        child: Builder(builder: (context) {
          final result = context.select((JobController job) => job.selectedJob);
          return Column(
            children: [
              Flexible(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage('${result.companyLogo}'),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                            ),
                            height: 100.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Employer: ${result.company}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                                child: Text("Employer Website",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold)),
                                onTap: () {
                                  launch('${result.companyUrl}');
                                }),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height -
                          -MediaQuery.of(context).size.height / 3,
                      padding: EdgeInsets.all(5.0),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          ListTile(
                            title: Text('Position',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal)),
                            subtitle: Text('${result.title}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                          ListTile(
                            title: Text('Location',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal)),
                            subtitle: Text('${result.location}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                          ListTile(
                            title: Text('Employment Type',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal)),
                            subtitle: Text('${result.type}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                          ListTile(
                            title: Text('Job Description',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.normal)),
                            subtitle: Text('${result.description}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                bottom: true,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text("View This Vacancy on Our Site",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            launch('${result.url}');
                          }),
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.indigo,
                          ),
                          child: Text("Apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            launch('${result.applying}');
                          }),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
