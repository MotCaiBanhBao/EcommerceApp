class ApiHelper {
  static const appName = "Ecommerce App";
  static const appVersion = 1;
  static const baseURI = "https://yluong-ecom-server.herokuapp.com";
  static const popularProductURI = "/api/items/";
  static const imageURI = "$baseURI/file/download/";
  static const token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyNjI2MzZjN2FjYzAzNDM4MmEwYThmZSIsImlhdCI6MTY1MjQyNzg3OCwiZXhwIjoxNjUyNDMxNDc4fQ.nlosHki6__V5MnBAoL3dWFzHKdZe3fJkX6XIOa6X7ls";

  static String getImageStreamURI(String fileName) => (imageURI + fileName);
}
