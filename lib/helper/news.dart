import 'dart:convert';
import "package:new_app_news/models/articlemodels.dart" ;
import 'package:http/http.dart' as http ; 


class News{ 
  
  List<AtricleModel> news = new List<AtricleModel>();
  Future<void> getNews()async{
      String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=c997c08cd18845eb824ca424c2d6cdca" ;
      var response = await http.get(url);
      
       jsondata = jsonDecode(response.body);
      if (jsondata['status']=="ok"){   //wfwfwqafwqfqw
        jsondata['articles'].forEach((element){
           if(element['urlToImage']!=null && element['description']!=null){
            AtricleModel articleModel = new AtricleModel (
               title: element['title'] , 
               imgUrl: element['urlToImage'] ,
               desc: element['description'] ,
               url: element['url'] ,
            );
            news.add(articleModel); 
           }
        });
      }
  }
  
}
class CategoryNews{

    List<AtricleModel> news  = [];
    Future <void> getNews ( String category ) async{
       String url = "http://newsapi.org/v2/top-headlines?&country=in&category=$category&apiKey=c997c08cd18845eb824ca424c2d6cdca";


       var response = await http.get(url) ;
       var jsondata = jsonDecode(response.body);

       if (jsondata['status'] == 'ok') {
         jsondata['articles'].forEach((element){
            if(element['urlToImage']!=null && element['description']!=null){
              AtricleModel atricleModel = new AtricleModel(
                title: element['title'] , 
                imgUrl: element['urlToImage'] ,
                desc: element['description'] ,
                url: element['url'] ,
              ) ;
              news.add(atricleModel);
              
            }
         });
       }
    }

}
