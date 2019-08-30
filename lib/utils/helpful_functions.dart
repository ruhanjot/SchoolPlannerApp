String shortenText(int len, String str){
  //Takes in a string and a desired length
  //cuts the string and adds ellipses so that the total length is the desired length
  String addEllipses(String str){
    while (str.substring(str.length - 1) == ' '){
      str = str.substring(0, str.length - 1);
    }
    return str;
  }

  if (str.length <= len){
    return str;
  } else{
    return addEllipses(str.substring(0, len - 3));
  }
}
