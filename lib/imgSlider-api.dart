import 'imgSliderpp.dart';
import 'package:http/http.dart' as http;

  Future<List<ImgSliderpp>> fetchimgSlide() async {
  String url = "http://localhost/catdemo/select-cat.php";
  final response = await http.get(url);
  return imgSliderppFromJson(response.body);
  }