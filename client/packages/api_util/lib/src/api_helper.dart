class ApiHelper {
  static const appName = "Ecommerce App";
  static const appVersion = 1;
  static const baseURI = "https://yluong-ecom-server.herokuapp.com";
  static const token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNjI2MzZjN2FjYzAzNDM4MmEwYThmZSIsImlhdCI6MTY1MjQyNzg3OCwiZXhwIjoxNjUyNDMxNDc4fQ.nlosHki6__V5MnBAoL3dWFzHKdZe3fJkX6XIOa6X7ls";

  static String deleteItem(String id) => ("$baseURI/api/items/$id");
  static String getItemByIdURI(String id) =>
      (baseURI + ApiEndPoints.getItem + id);
}

class ApiEndPoints {
  static const unFavorite = "/api/favorite/un";
  static const makeFavorite = "/api/favorite/make";
  static const confirm_order = "/api/confirm";
  static const getOrder = "/api/get_order";
  static const getOrders = "/api/orders";
  static const saveProduct = "/api/items";
  static const shopGetOrders = "/api/shop_get_orders";
  static const shopGetProducts = "/api/get_all_shop_item";
  static const cancleOrder = "/api/cancell";
  static const shopRegistration = "/api/shopRegistration";
  static const changeOrderStatus = "/api/change_order_status";
  static const isfavorite = "/api/isfavorite";
  static const shopGetOrder = "/api/shop_get_orders";
  static const getNotification = "/api/notification";
  static const pushChatUri = "/api/chat";
  static const getRoomChatUri = "/api/chat/room_chat";
  static const orderURI = "/api/orders";
  static const popularProductURI = "/api/items/";
  static const findProduct = "/api/items/find";
  static const login = "/api/otpLogin";
  static const verifyOTP = "/api/verifyOTP";
  static const getUser = "/api/user";
  static const getItem = "/api/item/";
  static const signup = "/api/register";
  static const resetPassword = "/api/resetPassword";
  static const pushReview = "/api/item/review";
  static const getAllFavoriteItem = "/api/get_favorite_item";
  static const getAnotherUser = "/api/get_another_user";
}
