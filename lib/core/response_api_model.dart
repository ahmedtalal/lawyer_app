bool successReposne = true;
bool failedResponse = false;
String mapKey = "key";
String mapValue = "value";
Map<String, dynamic> successRequest(var responseBody) {
  return {
    mapKey: successReposne,
    mapValue: responseBody,
  };
}

Map<String, dynamic> failedRequest(var responseBody) {
  return {
    mapKey: failedResponse,
    mapValue: responseBody,
  };
}
