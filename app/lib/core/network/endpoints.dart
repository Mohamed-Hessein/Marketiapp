class Endpoints {
  static String baseurl = 'https://supermarket-dan1.onrender.com/api/v1';
  static String signup = '/auth/signUp';
  static String signIn = '/auth/signIn';
  static String resetCode = '/auth/resetPassCode';
  static String activeCode = '/auth/activeResetPass';
  static String changePass = '/auth/resetPassword';
  static String getproduct = '/home/products?skip=0&limit=10';
  static String getCAtgroyProduct =
      '/home/products/category/smartphones?skip=0&limit=5';
  static String gteBrands = '/home/products/brand/Essence?skip=0&limit=5';
  static String getAllBrands = '/home/brands';
  static String catgroyNames = '/home/categories';
  static String SignUp(id) {
    return "$baseurl/$id";
  }
}

class ApiKeys {
  static String authorization = "Authorization";
  static String code = 'code';
  static String status = "status";
  static String ErrorMessage = "message";
  static String userNeme = "";
  static dynamic email = 'email';
  static String password = "password";
  static String message = "message";
  static String token = "token";
  static String id = "id";
  static String profilePic = "profilePic";
  static String location = "location";
  static String Phone = "phone";
  static String confrimPawword = "confirmPassword";
  static String name = "name";
}
