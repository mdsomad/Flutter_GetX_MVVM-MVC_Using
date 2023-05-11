


//TODO Create abstract class BaseApiServices
abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(dynamic data, String url);
}