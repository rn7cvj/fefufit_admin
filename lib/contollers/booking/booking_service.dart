import 'dart:async';

import 'package:chopper/chopper.dart';
import 'dart:convert';

part '../../gen/contollers/booking/booking_service.chopper.dart';

@ChopperApi()
abstract class BookingService extends ChopperService {
  Future<BookingBackendResponse> getBooking(String userId) async {
    Response res = await _getBooking("qr", userId);
    return convertResponse(res);
  }

  Future<void> confirmBooking(String eventId, String userId) async {
    await _confirmBooking(int.parse(eventId), int.parse(userId));
  }

  Future<void> unconfirmBooking(String eventId, String userId) async {
    await _unconfirmBooking(int.parse(eventId), int.parse(userId));
  }

  @Get(path: "/booking/view")
  Future<Response> _getBooking(@Query("screen") String screen, @Query("user_id") String userId);

  @Post(path: "/qr/confirm")
  Future<Response> _confirmBooking(@Field("event_id") int eventId, @Field("user_id") int userId);

  @Post(path: "/qr/unconfirm")
  Future<Response> _unconfirmBooking(@Field("event_id") int eventId, @Field("user_id") int userId);

  static BookingService create([ChopperClient? client]) => _$BookingService(client);
}

FutureOr<BookingBackendResponse> convertResponse(Response res) async {
  if (!res.isSuccessful) return BookingBackendResponse()..isSuccess = false;

  String jsonBody = const Utf8Decoder().convert(res.bodyBytes);
  List<dynamic> json = jsonDecode(jsonBody);

  List<BookingBackendModel> booking = json.map((e) => BookingBackendModel.fromJson(e)).toList();

  return BookingBackendResponse()
    ..isSuccess = true
    ..booking = booking;
}

class BookingBackendResponse {
  late bool isSuccess;

  List<BookingBackendModel>? booking;
}

class BookingBackendModel {
  int? id;
  String? eventName;
  String? beginTime;
  String? endTime;
  String? coachPhoneNumber;
  String? coachEmail;
  String? buildingName;
  int? totalSpaces;
  int? occupiedSpaces;
  String? areaName;
  bool? visibility;
  String? coachName;
  String? status;

  BookingBackendModel(
      {this.id,
      this.eventName,
      this.beginTime,
      this.endTime,
      this.coachPhoneNumber,
      this.coachEmail,
      this.buildingName,
      this.totalSpaces,
      this.occupiedSpaces,
      this.areaName,
      this.visibility,
      this.coachName,
      this.status});

  BookingBackendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventName = json['event_name'];
    beginTime = json['begin_time'];
    endTime = json['end_time'];
    coachPhoneNumber = json['coach_phone_number'];
    coachEmail = json['coach_email'];
    buildingName = json['building_name'];
    totalSpaces = json['total_spaces'];
    occupiedSpaces = json['occupied_spaces'];
    areaName = json['area_name'];
    visibility = json['visibility'];
    coachName = json['coach_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['event_name'] = this.eventName;
    data['begin_time'] = this.beginTime;
    data['end_time'] = this.endTime;
    data['coach_phone_number'] = this.coachPhoneNumber;
    data['coach_email'] = this.coachEmail;
    data['building_name'] = this.buildingName;
    data['total_spaces'] = this.totalSpaces;
    data['occupied_spaces'] = this.occupiedSpaces;
    data['area_name'] = this.areaName;
    data['visibility'] = this.visibility;
    data['coach_name'] = this.coachName;
    data['status'] = this.status;
    return data;
  }
}
