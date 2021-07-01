
import 'package:aov_farmage/CategoryDetails/ProductList/ProductListModel.dart';
import 'package:aov_farmage/LoginOtpScreen/LoginOtpModel.dart';
import 'package:aov_farmage/LoginPage/LoginModel.dart';
import 'package:aov_farmage/EditProfile/profileModel.dart';
import 'package:aov_farmage/helper/api_helper.dart';
import 'package:aov_farmage/model/AddToCard/AddToCart.dart';
import 'package:aov_farmage/model/CategoryListModel/CategoryListModel.dart';
import 'package:aov_farmage/model/YourCartList/YourCartList.dart';
import 'package:aov_farmage/model/YourCartRemove/YourCartRemove.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aov_farmage/model/RegisterMode/RegisterModel.dart';
import 'package:aov_farmage/model/ChangeAddress/ChangeAddressModel.dart';

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
Future<ProductListModel>product_details({String catId})async{
    final prefs=await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken":prefs.getString('token'),
      "search":"",
      "limit":"",
      "cat_id":catId
    };
    final response=await _apiHelper.post('Users_api/products_list', reqBody);
    try{
      return ProductListModel.fromJson(response);
    }
    catch(e)
  {
    showExceptionToast();
    return null;
  }
}
Future<AddToCartModel>add_to_cart({String productId,String variantId})async{
  final prefs=await SharedPreferences.getInstance();
  Map reqBody={
    "jwtToken":prefs.getString('token'),
    "product_id":productId,
    "variant_id":variantId
  };
  final response=await _apiHelper.post('Users_api/add_to_cart', reqBody);
  try{
    return AddToCartModel.fromJson(response);
  }
  catch(e)
  {
    showExceptionToast();
    return null;
  }
}
Future<YourCartListModel>my_cart()async{
    final prefs=await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken":prefs.getString('token')
    };
    final response=await _apiHelper.post('Users_api/my_cart_list', reqBody);
    try{
      return YourCartListModel.fromJson(response);
    }
    catch(e)
  {
    showExceptionToast();
    return null;
  }
}
Future<YourCartRemove>cart_remove({String productId,String variantId})async{
    final prefs=await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken":prefs.getString('token'),
      "product_id":productId,
      "variant_id":variantId
    };
    final response=await _apiHelper.post('Users_api/remove_cart_item', reqBody);
    try{
      return YourCartRemove.fromJson(response);
    }
    catch(e){
      showExceptionToast();
      return null;
    }
}
Future<ChangeAddressModel>add_user_address({String location,String flatNo,String buildingName,String landmark,String address_type,String pincode,String lat,String long,String personName,String personMobile,String note})async{
    final prefs=await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken":prefs.getString('token'),
      "location":location,
      "flat_no":flatNo,
      "building_name":buildingName,
      "landmark":landmark,
      "address_type":address_type,
      "pincode":pincode,
      "latitude":lat,
      "longitude":long,
      "contact_person_name":personName,
      "contact_person_mobile":personMobile,
      "note":note
    };
    final response=await _apiHelper.post('Users_api/add_user_address', reqBody);
    try{
      return ChangeAddressModel.fromJson(response);
    }
    catch(e)
  {
    showExceptionToast();
    return null;
  }
}
}

