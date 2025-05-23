// To parse this JSON data, do
//
//     final reviewHistoryResponseModel = reviewHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:ovoride_driver/data/model/global/ride/ride_model.dart';
import 'package:ovoride_driver/data/model/global/user/global_driver_model.dart';
import 'package:ovoride_driver/data/model/global/user/global_user_model.dart';

ReviewHistoryResponseModel reviewHistoryResponseModelFromJson(String str) =>
    ReviewHistoryResponseModel.fromJson(json.decode(str));

String reviewHistoryResponseModelToJson(ReviewHistoryResponseModel data) =>
    json.encode(data.toJson());

class ReviewHistoryResponseModel {
  String? remark;
  String? status;
  List<String>? message;
  Data? data;

  ReviewHistoryResponseModel({
    this.remark,
    this.status,
    this.message,
    this.data,
  });

  factory ReviewHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      ReviewHistoryResponseModel(
        remark: json["remark"],
        status: json["status"],
        message: json["message"] == null
            ? []
            : List<String>.from(json["message"]!.map((x) => x)),
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "remark": remark,
        "status": status,
        "message":
            message == null ? [] : List<dynamic>.from(message!.map((x) => x)),
        "data": data?.toJson(),
      };
}

class Data {
  List<Review>? reviews;
  String? userImagePath;
  String? driverImagePath;
  GlobalDriverInfo? driver;
  GlobalUser? rider;

  Data(
      {this.reviews,
      this.userImagePath,
      this.driverImagePath,
      this.driver,
      this.rider});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        userImagePath: json["user_image_path"],
        driverImagePath: json["driver_image_path"],
        driver: json["driver"] == null
            ? null
            : GlobalDriverInfo.fromJson(json["driver"]),
        rider:
            json["rider"] == null ? null : GlobalUser.fromJson(json["rider"]),
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "user_image_path": userImagePath,
        "driver_image_path": driverImagePath,
        "driver": driver?.toJson(),
        "rider": rider?.toJson(),
      };
}

class Review {
  String? id;
  String? userId;
  String? driverId;
  String? rideId;
  String? rating;
  String? review;
  String? createdAt;
  String? updatedAt;
  RideModel? ride;
  GlobalDriverInfo? driver;

  Review(
      {this.id,
      this.userId,
      this.driverId,
      this.rideId,
      this.rating,
      this.review,
      this.createdAt,
      this.updatedAt,
      this.ride,
      this.driver});

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"].toString(),
        userId: json["user_id"].toString(),
        driverId: json["driver_id"].toString(),
        rideId: json["ride_id"].toString(),
        rating: json["rating"].toString(),
        review: json["review"].toString(),
        ride: json['ride'] == null ? null : RideModel.fromJson(json['ride']),
        driver: json['driver'] == null
            ? null
            : GlobalDriverInfo.fromJson(json['driver']),
        createdAt: json["created_at"]?.toString(),
        updatedAt: json["updated_at"]?.toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "driver_id": driverId,
        "ride_id": rideId,
        "rating": rating,
        "review": review,
        "ride": ride,
        "driver": driver,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
