import 'package:flutter/material.dart';
import 'package:jobs/screens/details.dart';
import 'package:provider/provider.dart';
import 'package:jobs/models/jobs/jobcontroller.dart';

class Result extends StatefulWidget {
  final String? jobType;
  final String? companyName;
  final String? location;
  final String? jobTitle;
  final String? companyLogo;
  final String? id;
  final String? url;

  Result(
      {this.jobType,
      this.companyName,
      this.location,
      this.jobTitle,
      this.companyLogo,
      this.id,
      this.url});

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height / 2.5,
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Employer: ${widget.companyName}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          Text('Location: ${widget.location}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          Text('Title: ${widget.jobTitle}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          Text('Employement Type: ${widget.jobType}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold)),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              child: Text("View Job Details",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                Provider.of<JobController>(context, listen: false)
                    .getSelectedJob(widget.id!);
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Detailes();
                }));
              },
            ),
          ),
          Divider(
              color: Colors.grey, indent: 20.0, endIndent: 20.0, height: 10.0),
        ],
      ),
    );
  }
}
