class ProductAttachments {
  int? id;
  String? name;
  String? type;
  String? url;
  int? size;
  int? parentId;
  String? createdAt;
  String? updatedAt;

  ProductAttachments(
      {this.id,
        this.name,
        this.type,
        this.url,
        this.size,
        this.parentId,
        this.createdAt,
        this.updatedAt});

  ProductAttachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
    size = json['size'];
    parentId = json['parentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    data['size'] = this.size;
    data['parentId'] = this.parentId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}