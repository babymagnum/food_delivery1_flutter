import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/food_category/food_category.dart';
import 'package:dribbble_clone/model/popular/popular.dart';
import 'package:dribbble_clone/view/detail/widgets/list_popular_item.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {

  DetailView({Key key, this.item}): super(key: key);

  final FoodCategory item;

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  int _selectedIndex = 0;
  List<Popular> _listPopularWeek = [
    Popular('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/10/7/0/FNK_Greek-Salad_s4x3.jpg.rend.hgtvcom.826.620.suffix/1383814482359.jpeg', 'European Salad', '12.99', false),
    Popular('https://theforkedspoon.com/wp-content/uploads/2018/11/cheesy-asparagus-gratin-3-700x1050.jpg', 'Heavy Asparagus', '19.99', false),
    Popular('https://foodsguy.com/wp-content/uploads/2019/08/Peking-Duck-1170x790.jpg', 'Chinese Duck Barbeque', '20.99', false),
  ];
  List<Popular> _listPopularToday = [
    Popular('https://food.fnr.sndimg.com/content/dam/images/food/fullset/2013/10/7/0/FNK_Greek-Salad_s4x3.jpg.rend.hgtvcom.826.620.suffix/1383814482359.jpeg', 'European Salad', '12.99', false),
    Popular('https://theforkedspoon.com/wp-content/uploads/2018/11/cheesy-asparagus-gratin-3-700x1050.jpg', 'Heavy Asparagus', '19.99', false),
    Popular('https://foodsguy.com/wp-content/uploads/2019/08/Peking-Duck-1170x790.jpg', 'Chinese Duck Barbeque', '20.99', false),
  ];

  List<Widget> _listButtonMenu() {
    List<Widget> menus = List();
    List<String> images = [
      'assets/images/chicken.png',
      'assets/images/shrimp.png',
      'assets/images/burger.png',
      'assets/images/burger.png',
      'assets/images/burger.png',
    ];

    for (int i=0; i<images.length; i++) {
      menus.add(
        GestureDetector(
          onTap: () {
            setState(() => _selectedIndex = i);
            print('selected item menu ${images[_selectedIndex]}');
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            margin: EdgeInsets.only(left: 16, bottom: i == _selectedIndex ? 10 : 0, right: i == images.length - 1 ? 16 : 0),
            height: 65, width: 65,
            decoration: BoxDecoration(
              boxShadow: _selectedIndex == i ? [BoxShadow(
                color: Colors.orange.withAlpha(120),
                blurRadius: 8,
                offset: Offset(0, 3)
              )] : null,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: i == _selectedIndex ? Colors.orange : Colors.black12.withAlpha(15)
            ),
            child: Center(
              child: Image.asset(images[i], height: 50, width: 50, color: i == _selectedIndex ? Colors.white : Colors.black38,),
            ),
          ),
        ),
      );
    }

    return menus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColor.bg_screen,
        automaticallyImplyLeading: false,
        title: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(Icons.arrow_back, size: 25, color: Colors.black38,)
            ),
            Spacer(),
            Image.asset('assets/images/menu.png', width: 28, height: 28)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(widget.item.name, style: ThemeTextStyle.ubuntuB.apply(fontSizeDelta: 4),),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('${widget.item.totalMenu} Menus', style: ThemeTextStyle.ubuntuM.apply(color: Colors.black26, fontSizeDelta: -4),),
            ),
            SizedBox(height: 20,),
            Container(
              height: 75,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _listButtonMenu(),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Popular this week', style: ThemeTextStyle.ubuntuB.apply(fontSizeDelta: 2),)
                  ),
                  SizedBox(width: 10,),
                  Parent(
                    style: ParentStyle()..borderRadius(all: 5)..border(all: 1, color: Colors.black12)..ripple(true)..padding(horizontal: 10, vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Text('Vegetables', style: ThemeTextStyle.ubuntuM.apply(color: Colors.black26, fontSizeDelta: -2),),
                        SizedBox(width: 7,),
                        Icon(Icons.keyboard_arrow_down, size: 15, color: Colors.black26,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 231,
              child: NotificationListener(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listPopularWeek.length,
                  itemBuilder: (_, index) => ListPopularItem(
                    item: _listPopularWeek[index],
                    index: index,
                    isLast: index == _listPopularWeek.length - 1,
                    likeClick: (indexItem) => setState(() => _listPopularWeek[indexItem].isSelected = !_listPopularWeek[indexItem].isSelected),
                  )
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Popular today', style: ThemeTextStyle.ubuntuB.apply(fontSizeDelta: 2),)
                  ),
                  SizedBox(width: 10,),
                  Parent(
                    style: ParentStyle()..borderRadius(all: 5)..border(all: 1, color: Colors.black12)..ripple(true)..padding(horizontal: 10, vertical: 5),
                    child: Row(
                      children: <Widget>[
                        Text('Vegetables', style: ThemeTextStyle.ubuntuM.apply(color: Colors.black26, fontSizeDelta: -2),),
                        SizedBox(width: 7,),
                        Icon(Icons.keyboard_arrow_down, size: 15, color: Colors.black26,)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 231,
              child: NotificationListener(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _listPopularToday.length,
                  itemBuilder: (_, index) => ListPopularItem(
                    item: _listPopularToday[index],
                    index: index,
                    isLast: index == _listPopularToday.length - 1,
                    likeClick: (indexItem) => setState(() => _listPopularToday[indexItem].isSelected = !_listPopularToday[indexItem].isSelected),
                  )
                ),
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
