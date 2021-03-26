import 'package:flutter/material.dart';
import 'package:jobs/widgets/loading.dart';
import 'package:jobs/widgets/result.dart';
import 'package:provider/provider.dart';
import 'package:jobs/models/jobs/jobcontroller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Colors.white,
          ),
          height: 40.0,
          margin: EdgeInsets.all(5.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.grey, width: 0.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.black, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(color: Colors.blue, width: 0.5),
              ),
              labelText: "Search by Title",
              labelStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            controller: searchController,
            onSubmitted: (value) {
              setState(() {
                pressed = true;
                context.read<JobController>().getJobs(searchController.text);
              });
            },
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                searchController.clear();
                context.read<JobController>().allJobs.clear();
                setState(() {
                  pressed = false;
                });
              }),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: body(),
    );
  }

  body() {
    if (context.select((JobController job) => job.isLoading == true)) {
      return Center(
        child: Loading(),
      );
    } else if (context.select((JobController job) => job.allJobs.isEmpty)) {
      return Center(
        child: Text("No Related Jobs Found"),
      );
    } else {
      return Container(
        margin: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 0.0),
        child: pressed == false
            ? Center(
                child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 50.0,
              ))
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: context.watch<JobController>().allJobs.length,
                itemBuilder: (context, index) {
                  return Builder(builder: (context) {
                    final result = context
                        .select((JobController job) => job.allJobs[index]);
                    return Result(
                      jobType: result.type,
                      companyName: result.company,
                      location: result.location,
                      jobTitle: result.title,
                      url: result.url,
                      id: result.id,
                    );
                  });
                }),
      );
    }
  }
}
