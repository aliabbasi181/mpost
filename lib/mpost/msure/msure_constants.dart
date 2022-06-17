class MsureConstants {
  static String msureBaseUrl = "https://hidden-tor-50645.herokuapp.com/api/v1";
  static String token = '';
  static Map<String, dynamic> msureheaderWithToken = {
    'Authorization': '',
    'Accept': 'application/json'
  };

  static Map<String, dynamic> msureheader = {'Accept': 'application/json'};

  static setToken(var token) {
    msureheaderWithToken = {
      'Authorization': token,
      'Accept': 'application/json'
    };
  }
}
