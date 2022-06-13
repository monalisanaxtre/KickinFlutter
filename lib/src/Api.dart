import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

@RestApi(baseUrl: "https://www.naxtre.com/kickin-inn_dev/")
abstract class APIClient {
  // factory APIClient(Dio dio) = _APIClient;

  @POST("api/login")
  Future<String> loginPage(
      @Field("email") emailId, @Field("password") password);
}
