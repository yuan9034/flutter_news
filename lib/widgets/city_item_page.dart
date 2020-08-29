import 'package:flutter/widgets.dart';
import 'package:flutter_news/model/banner_entity.dart';
import 'package:flutter_news/model/city_entity.dart';
import 'package:flutter_news/model/news_home_arguments.dart';
import 'package:flutter_news/routers/routes.dart';

//各个地市展示的item布局
class CityItemPage extends StatelessWidget {
  Data data;
  BannerEntity bannerEntity;

  CityItemPage(this.data, this.bannerEntity);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.newsHomePage,
            arguments: NewsHomeArguments(data.id, bannerEntity));
      },
      child: Padding(
        padding: EdgeInsets.only(top: 15, bottom: 2),
        child: Column(
          children: [
            Container(
                child: Image.network(data.logo,
                    width: 80, height: 80, fit: BoxFit.fill)),
            Container(
                margin: EdgeInsets.only(top: 8),
                child: Text(
                  data.name,
                  style: TextStyle(color: Color(0xFF333333), fontSize: 14),
                  maxLines: 1,
                ))
          ],
        ),
      ),
    );
  }
}
