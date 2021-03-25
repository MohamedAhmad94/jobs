import 'package:flutter/material.dart';
import 'package:jobs/screens/details.dart';
import 'package:provider/provider.dart';
import 'package:jobs/models/jobs/jobcontroller.dart';

class Result extends StatefulWidget {
  final String? jobTitle;
  final String? jobType;
  final String? companyName;
  final String? companyLogo;
  final String? location;
  final String? id;

  Result(this.jobTitle, this.jobType, this.companyName, this.companyLogo,
      this.location, this.id);

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
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('${widget.companyLogo}'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0)),
              shape: BoxShape.rectangle,
            ),
            height: 100.0,
          ),
          Text('Employer: ${widget.companyName}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal)),
          Text('Location: ${widget.location}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal)),
          Divider(
              color: Colors.grey, indent: 30.0, endIndent: 30.0, height: 10.0),
          Text('Position: ${widget.jobTitle}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal)),
          Text('Type: ${widget.jobType}',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal)),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              child: Text("See Full Details",
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
        ],
      ),
    );
  }
}
