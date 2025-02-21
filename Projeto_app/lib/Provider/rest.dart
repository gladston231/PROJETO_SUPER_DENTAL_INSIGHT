import 'dart:convert';

import 'package:http/http.dart' as http;


Future<String> pegarUsuarios() async{
 var url = Uri.parse("https://dental-insight-default-rtdb.firebaseio.com/Users.json");

var feedBack = await http.get(url);
  if (feedBack.statusCode == 200){
  
    return jsonDecode(utf8.decode(feedBack.bodyBytes)).toString();
    
    
  }
  else {
    throw Exception("Deu erro!");
  }

}