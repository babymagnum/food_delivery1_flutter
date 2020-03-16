import 'package:division/division.dart';
import 'package:dribbble_clone/model/food_category/food_category.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme_color.dart';
import '../../../core/theme/theme_text_style.dart';

class ListFoodCategoryItem extends StatelessWidget {

  ListFoodCategoryItem({Key key, this.isFirst, this.isLast, this.item}): super(key: key);

  final bool isFirst;
  final bool isLast;
  final FoodCategory item;

  @override
  Widget build(BuildContext context) {
    return Parent(
      gesture: Gestures()..onTap(() {}),
      style: ParentStyle()..borderRadius(all: 10)..background.color(ThemeColor.food_category_grey)..ripple(true)..margin(top: isFirst ? 0 : 15, bottom: isLast ? 25 : 0)..padding(horizontal: 10, vertical: 12),
      child: Row(
        children: <Widget>[
          Image.asset(item.image, width: 50, height: 50,),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item.name, style: ThemeTextStyle.ubuntuM.apply(),),
                SizedBox(height: 7,),
                Text('${item.totalMenu} Food Menus', style: ThemeTextStyle.ubuntuM.apply(color: Colors.black26, fontSizeDelta: -4),),
              ],
            )
          ),
          SizedBox(width: 10,),
          Icon(Icons.keyboard_arrow_right, size: 25, color: Colors.black26.withAlpha(35),)
        ],
      ),
    );
  }
}
