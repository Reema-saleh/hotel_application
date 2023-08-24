class Review {
  String? reviewId;
  String? commit;
  double? rating;

  Review({this.reviewId, this.commit, this.rating});

  Review.fromJson(Map<String, dynamic> json) {
    reviewId = json["review_id"];
    commit = json["commit"];
    rating = json["rating"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["review_id"] = reviewId;
    data["commit"] = commit;
    data["rating"] = rating;

    return data;
  }
}
