class Constant {
  static const String baseUrl = "https://api.github.com/";
  static const int SliderCount = 5;



   //key cache
  static const localKey="ModelCache";



  static final Constant _instance = Constant._internal();

  Constant._internal();

  static Constant get instance => _instance;
}
