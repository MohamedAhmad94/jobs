class JobModel {
  String? id;
  String? type;
  String? title;
  String? url;
  String? company;
  String? companyUrl;
  String? companyLogo;
  String? location;
  String? description;
  String? applying;

  JobModel(
      {this.id,
      this.type,
      this.title,
      this.url,
      this.company,
      this.companyUrl,
      this.companyLogo,
      this.location,
      this.description,
      this.applying});
}
