import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jobs/models/jobs/jobmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobController with ChangeNotifier, DiagnosticableTreeMixin {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<JobModel> _allJobs = [];
  List<JobModel> get allJobs => _allJobs;

  String? _selectedJobId;
  String? get selectedJobId => _selectedJobId;

  JobModel get selectedJob {
    return _allJobs.firstWhere((JobModel job) {
      return job.id == _selectedJobId;
    });
  }

  getSelectedJob(String id) {
    return _selectedJobId = id;
  }

  getJobs(String searchKeyword) async {
    _isLoading = true;
    notifyListeners();

    http.Response _response = await http.get(
      Uri.https('jobs.github.com', '/positions?search=$searchKeyword'),
      headers: {
        'content-type': 'application/json; charset=utf-8',
      },
    );

    var _convert = json.decode(_response.body);
    _convert.forEach((i) {
      if (_response.statusCode == 200) {
        final JobModel _newJob = JobModel(
            id: i['id'],
            type: i['type'],
            title: i['title'],
            url: i['url'],
            company: i['company'],
            companyUrl: i['company_url'],
            companyLogo: i['company_logo'],
            location: i['location'],
            description: i['description'],
            applying: i['applying']);
        _allJobs.add(_newJob);
        _isLoading = false;
        notifyListeners();
      } else {
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('job', allJobs.length));
  }
}
