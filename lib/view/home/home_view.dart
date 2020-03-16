import 'package:division/division.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/food_category/food_category.dart';
import 'package:dribbble_clone/view/home/widgets/list_food_category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/theme/theme_text_style.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'my-home-page';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<FoodCategory> _listFoodCategory = [
    FoodCategory('assets/images/appetizer.png', 'Appetizer', 12),
    FoodCategory('assets/images/main_course.png', 'The Main Food', 12),
    FoodCategory('assets/images/desserts.png', 'Dessert', 12),
  ];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top + 20),
              // Name and image section //
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Hello Arief!', style: ThemeTextStyle.ubuntuR.apply(color: Colors.black38, fontSizeDelta: -4),),
                        SizedBox(height: 10,),
                        Text('Choose your food today', style: ThemeTextStyle.ubuntuM.apply(),),
                      ],
                    )
                  ),
                  SizedBox(width: 10,),
                  PlaceholderNetworkImage(url: 'https://riportus.com/wp-content/uploads/2016/11/team1-5.jpg', size: Size(50, 50), borderRadius: 25,)
                ],
              ),
              SizedBox(height: 25,),
              // Search bar section //
              Parent(
                gesture: Gestures()..onTap(() {}),
                style: ParentStyle()..ripple(true)..borderRadius(all: 5)..background.color(Colors.black12.withAlpha(10))..padding(all: 10),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, size: 20, color: Colors.orange,),
                    SizedBox(width: 7,),
                    Expanded(
                      child: Text('Search...', style: ThemeTextStyle.ubuntuR.apply(color: Colors.black26, fontSizeDelta: -2),)
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.black26,)
                  ],
                ),
              ),
              SizedBox(height: 25,),
              // Image order now section //
              Container(
                height: MediaQuery.of(context).size.width * 0.5, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/order_now.png')
                  )
                ),
              ),
              SizedBox(height: 25,),
              // Food category section //
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Food Category', style: ThemeTextStyle.ubuntuM.apply())
                  ),
                  SizedBox(width: 10,),
                  Text('View All', style: ThemeTextStyle.ubuntuR.apply(color: Colors.orange, fontSizeDelta: -4),)
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListFoodCategoryItem(
                  item: _listFoodCategory[index],
                  isFirst: index == 0,
                  isLast: index == _listFoodCategory.length - 1,
                ),
                itemCount: _listFoodCategory.length,
              )
            ],
          ),
        ),
      ),
    );
  }
}