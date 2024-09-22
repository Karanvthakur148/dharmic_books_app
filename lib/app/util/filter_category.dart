class FilterCategory {
  int? countryId;
  int? zoneId;

  FilterCategory({this.countryId, this.zoneId});

  FilterCategory.fromJson(Map<String, dynamic> json) {
    countryId = json['countryId'];
    zoneId = json['zoneId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.countryId;
    data['zoneId'] = this.zoneId;
    return data;
  }
}
