class Endpoints {
  static String baseurl = 'https://supermarket-dan1.onrender.com/api/v1';
  static String signup = '/auth/signUp';
  static String signIn = '/auth/signIn';
  static String resetCode = '/auth/resetPassCode';
  static String activeCode = '/auth/activeResetPass';
  static String changePass = '/auth/resetPassword';
  static String getproduct = '/home/products?skip=0&limit=10';

  static String getALLproduct = '/home/products';
  static String details = '/home/products/1';
  static String getCAtgroyProduct = '/home/products/category/smartphones';
  static String gteBrands = '/home/products/brand/Essence?skip=0&limit=5';
  static String getAllBrands = '/home/brands';
  static String catgroyNames = '/home/categories';
  static String search = '/home/productsFilter';
  static String product_ofCAtgory = '/home/products/category/smartphones';
  static const favPost = '/user/addFavorite';
  static const getfav = '/user/getFavorite';
  static const deletefav = '/user/deleteFavorite';
  static const addCart = '/user/addCart';
  static const getCArt = '/user/getCart';
  static const deleteCart = '/user/deleteCart';
  static const String upLoadImage = '/portfoilo/addImage';
  static const String getUserPRofile = '/portfoilo/userData';
  static String SignUp(id) {
    return "$baseurl/$id";
  }

  static String Details(id) {
    return "/home/products/$id";
  }

  static String getNamed(name) {
    return '/home/products/category/$name';
  }

  static String getNamedBrand(name) {
    return '/home/products/brand/$name';
  }
}

class ApiKeys {
  static const favProductId = "productId";
  static String limit = "limit";
  static String serach = "search";
  static String skip = "skip";
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
