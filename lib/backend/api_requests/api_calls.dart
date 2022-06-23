import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class TestCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'test',
      apiUrl:
          'https://62a2c30e5bd3609cee59ceb1.mockapi.io/wetaus/v1/interactions/1',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class APIShowDemoCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'API show demo',
      apiUrl:
          'https://zgoet81862.execute-api.ap-southeast-1.amazonaws.com/demo/v1/interaction',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: '',
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
