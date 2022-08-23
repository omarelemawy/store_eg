class CollectionModel {
  bool? status;
  String? message;
  Data1? data;

  CollectionModel({this.status, this.message, this.data});

  CollectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data1 {
  int? currentPage;
  List<Item>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data1(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data1.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Item>[];
      json['data'].forEach((v) {
        data!.add( Item.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Item {
  int? id;
  String? productName;
  int? storeId;
  String? storeName;
  int? brandId;
  String? brandName;
  String? discount;
  bool? freeShipping;
  String? createdAt;
  String? price;
  String? netPrice;
  int? materialRate;
  String? materialName;
  int? categoryId;
  String? hex;
  int? basicUnitCount;
  bool? isFavorited;
  int? bestSelling;
  Null? bestRated;
  List<Colors>? colors;
  int? numberOfFollowers;
  int? numberOfViews;
  bool? hasDiscount;
  int? rate;
  String? image;

  Item(
      {this.id,
        this.productName,
        this.storeId,
        this.storeName,
        this.brandId,
        this.brandName,
        this.discount,
        this.freeShipping,
        this.createdAt,
        this.price,
        this.netPrice,
        this.materialRate,
        this.materialName,
        this.categoryId,
        this.hex,
        this.basicUnitCount,
        this.isFavorited,
        this.bestSelling,
        this.bestRated,
        this.colors,
        this.numberOfFollowers,
        this.numberOfViews,
        this.hasDiscount,
        this.rate,
        this.image});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    storeId = json['store_id'];
    storeName = json['store_name'];
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    discount = json['discount'];
    freeShipping = json['free_shipping'];
    createdAt = json['created_at'];
    price = json['price'];
    netPrice = json['net_price'];
    materialRate = json['material_rate'];
    materialName = json['material_name'];
    categoryId = json['category_id'];
    hex = json['hex'];
    basicUnitCount = json['basic_unit_count'];
    isFavorited = json['is_favorited'];
    bestSelling = json['best_selling'];
    bestRated = json['best_rated'];
    if (json['colors'] != null) {
      colors = <Colors>[];
      json['colors'].forEach((v) {
        colors!.add(new Colors.fromJson(v));
      });
    }
    numberOfFollowers = json['number_of_followers'];
    numberOfViews = json['number_of_views'];
    hasDiscount = json['has_discount'];
    rate = json['rate'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    data['discount'] = this.discount;
    data['free_shipping'] = this.freeShipping;
    data['created_at'] = this.createdAt;
    data['price'] = this.price;
    data['net_price'] = this.netPrice;
    data['material_rate'] = this.materialRate;
    data['material_name'] = this.materialName;
    data['category_id'] = this.categoryId;
    data['hex'] = this.hex;
    data['basic_unit_count'] = this.basicUnitCount;
    data['is_favorited'] = this.isFavorited;
    data['best_selling'] = this.bestSelling;
    data['best_rated'] = this.bestRated;
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    data['number_of_followers'] = this.numberOfFollowers;
    data['number_of_views'] = this.numberOfViews;
    data['has_discount'] = this.hasDiscount;
    data['rate'] = this.rate;
    data['image'] = this.image;
    return data;
  }
}

class Colors {
  int? id;
  String? name;
  String? hex;

  Colors({this.id, this.name, this.hex});

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hex'] = this.hex;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
