import 'package:html/parser.dart';

class DirectoryConstants {
  static String baseURL = "https://classifieds.mpost.co.ke/wp-json";
  static String endURL =
      "consumer_key=ck_c52b637de88ebe5c22f2cdef68ae6a98c5635879&consumer_secret=cs_e2631001e8e7c478d54da557b3d736f5449acf5f";

  static String setUrl(String path) {
    if (path.split('?').length > 1) {
      return baseURL + path + "&" + endURL;
    } else {
      return baseURL + path + "?" + endURL;
    }
  }

  static String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }
}
