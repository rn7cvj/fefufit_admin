// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../../contollers/building/building_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_string_interpolations, unnecessary_brace_in_string_interps
final class _$BuildingService extends BuildingService {
  _$BuildingService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BuildingService;

  @override
  Future<Response<dynamic>> _getBuilding(dynamic screen) {
    final Uri $url = Uri.parse('/building/view');
    final Map<String, dynamic> $params = <String, dynamic>{'screen': screen};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _addBuilding(String buildingName) {
    final Uri $url = Uri.parse('/building/add');
    final $body = <String, dynamic>{'building_name': buildingName};
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _deleteBuilding(int buidlingId) {
    final Uri $url = Uri.parse('/building/delete');
    final Map<String, dynamic> $params = <String, dynamic>{
      'building_id': buidlingId
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _editBuilding(
    int buildingId,
    dynamic buildingName,
    bool active,
  ) {
    final Uri $url = Uri.parse('/building/edit');
    final Map<String, dynamic> $params = <String, dynamic>{
      'building_id': buildingId
    };
    final $body = <String, dynamic>{
      'building_name': buildingName,
      'active': active,
    };
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> _uploadImage(
    String buidlingId,
    MultipartFile image,
  ) {
    final Uri $url = Uri.parse('/upload');
    final Map<String, dynamic> $params = <String, dynamic>{
      'building_id': buidlingId
    };
    final Map<String, String> $headers = {
      'Content-Type': 'multipart/form-data',
    };
    final List<PartValue> $parts = <PartValue>[
      PartValueFile<MultipartFile>(
        'files',
        image,
      )
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
      parameters: $params,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
