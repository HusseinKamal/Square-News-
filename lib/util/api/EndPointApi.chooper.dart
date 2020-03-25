part of 'EndPointApi.dart';
class _$EndPointApi extends EndPointApi
{
  _$EndPointApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }
  final definitionType=EndPointApi;
  @override
  Future<Response> getNews() {
    final $url=Constant.newsURL;
    final $request=Request('GET', $url,client.baseUrl);
    return client.send<dynamic,dynamic>($request);
  }

}

