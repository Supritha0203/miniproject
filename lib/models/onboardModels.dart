class onboardModels {
  String? image;
  String? description;

  onboardModels({this.image, this.description});

  onboardModels.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
  }
}
