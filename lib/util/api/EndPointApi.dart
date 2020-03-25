import 'package:chopper/chopper.dart';
import 'package:movies_land/util/Constant.dart';
import 'package:http/io_client.dart' as http;
import 'dart:io';
// Source code generation in Dart works by creating a new file which contains a "companion class".
// In order for the source gen to know which file to generate and which files are "linked", you need to use the part keyword.
part 'EndPointApi.chooper.dart';
@ChopperApi(baseUrl:Constant.baseURL)
abstract class EndPointApi extends ChopperService {
  @Get()
  Future<Response> getNews();

  static EndPointApi create()
  {
    final client=ChopperClient(
        baseUrl: Constant.baseURL,
        services:[
          _$EndPointApi(),
        ],
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 60),
        ),
        converter: JsonConverter() );
    return _$EndPointApi(client);
  }
}