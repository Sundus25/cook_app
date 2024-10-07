import 'package:cook_project/model/meal_model.dart';
import 'package:cook_project/model/user_model.dart';
import 'package:dio/dio.dart';

String token = "";
Future<bool> login(UserModel user) async {
  try {
    Dio dio = Dio();

    Response response = await dio.post(
        'https://food-api-omega.vercel.app/api/v1/chef/signin',
        data: {'email': user.email, 'password': user.password});

    if (response.statusCode == 202) {
      token = response.data["token"];
      print(token);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<MealModel> fetchMeal() async {
  Dio dio = Dio();

  Response response = await dio.get(
      "https://food-api-omega.vercel.app/api/v1/chef/get-chef/66166877047e0824bcaa3368/meals",
      options: Options(headers: {"token": "FOODAPI $token"}));

  MealModel meal = MealModel.fromMap(response.data);

  return meal;
}
