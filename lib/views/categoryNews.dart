import 'package:flutter/material.dart' ;
import 'package:new_app_news/helper/news.dart' ;
import 'package:new_app_news/models/articlemodels.dart';
import 'package:new_app_news/models/categorymodel.dart';
import 'package:new_app_news/views/articleView.dart';
import 'package:new_app_news/views/home.dart' ; 


class CategoriesNews extends StatefulWidget {
  final String categoryName ;
  CategoriesNews({this.categoryName});
  @override
  _CategoriesNewsState createState() => _CategoriesNewsState();
}

class _CategoriesNewsState extends State<CategoriesNews> {



  List<CategoryModel> catlists = new List<CategoryModel>();
  

  var articles;
  bool _loading = true ;

  
 
  void initState(){
    
    getCategoryNews() ;

    super.initState() ;
  }

  getCategoryNews()async{

    CategoryNews cnews = new CategoryNews() ;

    await cnews.getNews(widget.categoryName) ;
    
    articles = cnews.news;

    setState(() {

      _loading = false ;

    });
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('Flutter news'),
       ),
       // ------------------------------------------ loading 
       body: _loading ? Center(
              child: Container(
              child: CircularProgressIndicator (
            ),
          ),
        )
         // this is loading  
         :
         SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:16),
            padding: EdgeInsets.symmetric(horizontal:16),
           child: Column(
             children: <Widget>[

               
              // blocks ------------------------------------------------
               Container( 
                    
                     child: ListView.builder(
                         itemCount: articles.length,
                         shrinkWrap: true,
                         physics: ClampingScrollPhysics(),
                         itemBuilder: (context,index){
                           return BlockTiles(
                             title: articles[index].title ?? "",
                             desc: articles[index].desc ?? "",
                             imgUrl: articles[index].imgUrl ?? "",
                             url: articles[index].url,
                           );
                         },
                      ),      
               ) ,
             ],
           ),
       ),
         ),
    );
  }
}

class BlockTiles extends StatelessWidget {

  final String title, imgUrl, desc , url ;
  BlockTiles({  this.title,  this.imgUrl,  this.desc , @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context , MaterialPageRoute(
            builder: (context) => ArticleView(
                 blogUrl: url,
            ) 
          ));
        },
        child: Container(
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(6),        
        ),
        padding: EdgeInsets.only(bottom: 10,top: 10),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), 
              ),
              child: Image.network(imgUrl),            
            ),
            Container(
            padding: EdgeInsets.only(top:12),
            child: Column(
            children:[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:10),
                        child: Text(title,style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                       ),),
                  ),
                  Container(
                      padding: EdgeInsets.only(top:7 ,left: 10 ,right: 10),
                      child: Text(desc),
                  ),              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}