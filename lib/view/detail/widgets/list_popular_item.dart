import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/popular/popular.dart';
import 'package:flutter/material.dart';

class ListPopularItem extends StatelessWidget {

  ListPopularItem({Key key, this.isLast, this.item, this.index, this.likeClick}): super(key: key);

  final int index;
  final Function(int) likeClick;
  final Popular item;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: isLast ? 16 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              PlaceholderNetworkImage(url: item.images, size: Size(MediaQuery.of(context).size.width * 0.4, 180), borderRadius: 5,),
              Positioned(
                top: 10, right: 10,
                child: Parent(
                  gesture: Gestures()..onTap(() => likeClick(index)),
                  style: ParentStyle()..height(35)..width(35)..borderRadius(all: 35/2)..background.color(Colors.white.withOpacity(0.8)),
                  child: Center(
                    child: Icon(Icons.favorite, size: 20, color: item.isSelected ? Colors.pinkAccent : Colors.black38,),
                  ),
                )
              )
            ],
          ),
          SizedBox(height: 10,),
          Text(item.title, style: ThemeTextStyle.ubuntuM,),
          SizedBox(height: 5,),
          Text('\$ ${item.price}', style: ThemeTextStyle.ubuntuR.apply(fontSizeDelta: -3, color: Colors.black54),)
        ],
      ),
    );
  }
}
