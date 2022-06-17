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
    final body = '''
{
  "url": "https://ab2c-8-21-11-11.ap.ngrok.io/remote/object/call"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'API show demo',
      apiUrl:
          'https://s5vq11681a.execute-api.us-east-1.amazonaws.com/demo/v1/enqueue',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
