import 'package:new_app_news/helper/data.dart';
import 'package:new_app_news/models/categorymodel.dart';
import 'package:flutter/material.dart'; 
import 'package:new_app_news/models/articlemodels.dart';
import 'package:new_app_news/helper/news.dart' ; 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:new_app_news/views/articleView.dart';
import 'package:new_app_news/views/categoryNews.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> catlist = new List<CategoryModel>();
  List<AtricleModel> articlemodel = new List<AtricleModel>() ;

  String categoryName ; 
  

  bool _loading = true ;

  void initState() {

    super.initState();

    catlist = getCategory();

    getnews(); 

  }

  getnews()async{
    
    News newsClass = News() ;

    await newsClass.getNews() ;

    articlemodel  = newsClass.news;

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
              // Categories --------------------------------------------
                Container(
                  
                  height: 70 ,
                  child: ListView.builder(
                    itemCount: catlist.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder:(context,index){
                      return CategoryTile(
                        imageUrl: catlist[index].imgUrl,
                        cname: catlist[index].cname,
                      );
                    } ,                  
                  ),
                ),
              // blocks ------------------------------------------------
               Container( 
                     
                     child: ListView.builder(
                         itemCount: articlemodel.length,
                         shrinkWrap: true,
                         physics: ClampingScrollPhysics(),
                         
                         itemBuilder: (context,index){
                           return BlockTile(
                             title: articlemodel[index].title,
                             desc: articlemodel[index].desc,
                             imgUrl: articlemodel[index].imgUrl,
                             url: articlemodel[index].url,
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

////////////// categories /////////////////////////////

class CategoryTile extends StatelessWidget {
  final imageUrl , cname ; 
  CategoryTile({this.imageUrl , this.cname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context) => 
                 CategoriesNews(
                    categoryName:cname,
                 ),
             ));
                
        },
        child: Container(
        margin: EdgeInsets.only(right:16),
         child: Stack(
           children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,width: 120,height: 60,fit: BoxFit.cover,
                )
                ),
              Container(
                alignment:  Alignment.center,
                  width: 120,height: 60,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                child: Text(cname,style: TextStyle(
                  color: Colors.white ,
                  fontSize: 14 ,
                  fontWeight: FontWeight.bold,                 
                )),
              )            
           ], 
         ),      
      ),
    );
  }
}

///////// block tile ////////////////////////////
class BlockTile extends StatelessWidget {

  final String title, imgUrl, desc , url ;
  BlockTile({ @required this.title, @required this.imgUrl, @required this.desc , @required this.url});

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