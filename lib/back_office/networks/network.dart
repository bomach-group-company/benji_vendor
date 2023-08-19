class Network {
  static String baseUrl = "https://benji-app-one-9146d01ad651.herokuapp.com";
  static String getTokenUrl = "$baseUrl/api/v1/auth/token";
  static String regVendor = "${baseUrl}/api/v1/vendors/createVendor";
  static String updateProd = "${baseUrl}/api/v1/products/changeProduct/";
  static String deleteProd = "${baseUrl}/api/v1/products/deleteProduct/";
  static String user = "${baseUrl}/api/v1/vendors/getVendor/";
  static String userId = "${baseUrl}/api/v1/auth";
  static String rating = "${baseUrl}/api/v1/vendors/";
  static String uploadProduct = "${baseUrl}/api/v1/products/addProduct";
  static String myProduct = "${baseUrl}/api/v1/vendors/";
  static String categories = "${baseUrl}/api/v1/categories/list";
  static String subCategories = "${baseUrl}/api/v1/sub_categories/list";

  static String notification = "${baseUrl}/api/v1/vendors/";

  static String myOrders = "${baseUrl}/api/v1/vendors/";
  static String averageRating = "${baseUrl}/api/v1/vendors/";

  static String addProdVariety = "${baseUrl}/api/v1/products/addProductVariety";

  static String getProdVarietyList =
      "${baseUrl}/api/v1/products/getProductVarietiesList";
  static String addVarietyOption =
      "${baseUrl}/api/v1/products/addVarietyOption";
  static String getVarietyOption =
      "${baseUrl}/api/v1/products/getVarietyOption";

  static String logout = "${baseUrl}/api/v1/auth/logout";
  static String acceptOrder = "${baseUrl}/api/v1/vendors/vendorAcceptOrder";
  static String cancelOrder = "${baseUrl}/api/v1/vendors/vendorCancelOrder";
  static String declineOrder = "${baseUrl}/api/v1/vendors/vendorDeclineOrder";
}

const header = "application/json";
const content = "application/x-www-form-urlencoded";
