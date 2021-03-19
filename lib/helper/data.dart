import 'package:flutter/material.dart' ; 
import 'package:new_app_news/models/categorymodel.dart' ;


List<CategoryModel>  getCategory(){
   
  List<CategoryModel> catList = new List<CategoryModel>();
  CategoryModel catmodel ;

  catmodel = new CategoryModel() ;
  catmodel.imgUrl= "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fblogs-images.forbes.com%2Falejandrocremades%2Ffiles%2F2018%2F12%2Fbusiness-3605367_1920-1200x741.jpg" ;
  catmodel.cname = "business" ; 
  catList.add(catmodel);
  
  catmodel = new CategoryModel() ;
  catmodel.imgUrl= "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fblogs-images.forbes.com%2Falejandrocremades%2Ffiles%2F2018%2F12%2Fbusiness-3605367_1920-1200x741.jpg" ;
  catmodel.cname = "health" ; 
  catList.add(catmodel);
  
  catmodel = new CategoryModel() ;
  catmodel.imgUrl= "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fblogs-images.forbes.com%2Falejandrocremades%2Ffiles%2F2018%2F12%2Fbusiness-3605367_1920-1200x741.jpg" ;
  catmodel.cname = "science" ; 
  catList.add(catmodel);

  catmodel = new CategoryModel() ;
  catmodel.imgUrl= "https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fblogs-images.forbes.com%2Falejandrocremades%2Ffiles%2F2018%2F12%2Fbusiness-3605367_1920-1200x741.jpg" ;
  catmodel.cname = "General" ; 
  catList.add(catmodel);
  
  

  
  return catList ; 





}