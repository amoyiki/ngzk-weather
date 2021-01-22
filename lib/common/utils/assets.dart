
class AssetsUtil {
  
  static String getImgPath(String subpath, String name, {String format: 'png'}) {
    return 'assets/images/$subpath/$name.$format';
  }
  
}