import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jobs/models/jobs/jobmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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

    var url = Uri.parse(
        'https://jobs.github.com/positions.json?search=$searchKeyword');

    http.Response _response = await http.get(
      url,
      headers: {
        'content-Type': 'application/json; charset=utf-8',
      },
    );

    var _convert = convert.jsonDecode(_response.body);
    _convert.forEach((i) {
      if (_response.statusCode == 200) {
        final JobModel _newJob = JobModel(
            id: i['id'],
            type: i['type'],
            url: i['url'],
            company: i['company'],
            companyUrl: i['company_url'],
            location: i['location'],
            title: i['title'],
            description: i['description'],
            howToApply: i['How_to_Apply'],
            companyLogo: i['company_logo']);
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
