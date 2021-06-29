
import 'package:aov_farmage/LoginOtpScreen/LoginOtpModel.dart';
import 'package:aov_farmage/LoginPage/LoginModel.dart';
import 'package:aov_farmage/EditProfile/profileModel.dart';
import 'package:aov_farmage/helper/api_helper.dart';
import 'package:aov_farmage/model/CategoryListModel/CategoryListModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aov_farmage/model/RegisterMode/RegisterModel.dart';

class HttpServices {
  ApiBaseHelper _apiHelper = ApiBaseHelper();

  Future _init() async {
    final _prefs = await SharedPreferences.getInstance();
    int _id = _prefs.getInt('userID') ?? 0;
    // _userID = _id.toString();
    // _token = _prefs.getString('token');
    //_deviceToken = _prefs.getString("deviceToken");
  }

  showExceptionToast() {
    Fluttertoast.showToast(msg: 'Something Went Wrong', timeInSecForIosWeb: 10);
  }

  Future<RegisterModel> user_register_api(
      {String name, String email, String phone, String gender}) async {
    Map reqBody = {
      "phone": phone,
      "name": name,
      "email": email,
      "gender": gender,
    };
    final response = await _apiHelper.post('Users_api/register_api', reqBody);
    try {
      return RegisterModel.fromJson(response);
    }
    catch (e) {
      showExceptionToast();
      return null;
    }

  }
  Future<Login>user_login({String number})async{
    Map reqBody={
      "number":number
    };
    final response=await _apiHelper.post('Users_api/user_request_otp_for_login', reqBody);
    try{
      return Login.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }

  Future<LoginOtpModel> user_otp_login({String number,String otp})async{
    Map reqBody={
      "number":number,
      "otp":otp
    };
    final response=await _apiHelper.post('/Users_api/users_login_api', reqBody);
    try{
      return LoginOtpModel.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
}
Future<Login>user_otp_register({String number})async{
  Map reqBody={
    "number":number
  };
  final response=await _apiHelper.post('Users_api/request_otp_for_regester', reqBody);
  try{
    return Login.fromJson(response);
  }
  catch(e)
  {
    showExceptionToast();
    return null;
  }
    
}

Future<ProfileModel> getProfile()async{
  final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken":prefs.getString('token')
    };
    final response=await _apiHelper.post('Users_api/get_profile_data', reqBody);
    try{
      return ProfileModel.fromJson(response);
    }
    catch(e)
  {
    showExceptionToast();
    return null;
  }
}

Future<CategoryListModel>category_list_api()async{
  final prefs = await SharedPreferences.getInstance();
  Map reqBody={
    "jwtToken":prefs.getString('token'),
    "search":"",
    "limit":""
  };
  final response=await _apiHelper.post('Users_api/categories_list', reqBody);
  try{
    return CategoryListModel.fromJson(response);
  }
  catch(e)
  {
    showExceptionToast();
    return null;
  }
}
}

