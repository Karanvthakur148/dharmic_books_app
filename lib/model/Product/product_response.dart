import 'package:quran_app/model/Product/category_response.dart';
import 'package:quran_app/model/Product/product_attachment_res.dart';

class ProductResponse {
  List<Products>? data;

  ProductResponse({this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  int? categoryId;
  Null? cost;
  int? price;
  Null? stock;
  Null? hasVariant;
  Null? tags;
  Null? isFeatured;
  String? sku;
  Null? tax;
  Null? description;
  String? createdAt;
  String? updatedAt;
  Category? category;
  List<ProductAttachments>? productAttachments;
  // List<Null>? productVariants;

  Products(
      {this.id,
        this.name,
        this.categoryId,
        this.cost,
        this.price,
        this.stock,
        this.hasVariant,
        this.tags,
        this.isFeatured,
        this.sku,
        this.tax,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.category,
        this.productAttachments,
        // this.productVariants
      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    categoryId = json['categoryId'];
    cost = json['cost'];
    price = json['price'];
    stock = json['stock'];
    hasVariant = json['hasVariant'];
    tags = json['tags'];
    isFeatured = json['isFeatured'];
    sku = json['sku'];
    tax = json['tax'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['Category'] != null
        ? new Category.fromJson(json['Category'])
        : null;
    if (json['ProductAttachments'] != null) {
      productAttachments = <ProductAttachments>[];
      json['ProductAttachments'].forEach((v) {
        productAttachments!.add(new ProductAttachments.fromJson(v));
      });
    }
    // if (json['ProductVariants'] != null) {
    //   productVariants = <Null>[];
    //   json['ProductVariants'].forEach((v) {
    //     productVariants!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['cost'] = this.cost;
    data['price'] = this.price;
    data['stock'] = this.stock;
    data['hasVariant'] = this.hasVariant;
    data['tags'] = this.tags;
    data['isFeatured'] = this.isFeatured;
    data['sku'] = this.sku;
    data['tax'] = this.tax;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.category != null) {
      data['Category'] = this.category!.toJson();
    }
    if (this.productAttachments != null) {
      data['ProductAttachments'] =
          this.productAttachments!.map((v) => v.toJson()).toList();
    }
    // if (this.productVariants != null) {
    //   data['ProductVariants'] =
    //       this.productVariants!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}




