import 'package:flutter/material.dart';
import 'package:flutter_news/common/Config.dart';
import 'package:flutter_news/model/category_entity.dart';
import 'package:flutter_news/model/news_home_arguments.dart';
import 'package:flutter_news/routers/routes.dart';
import 'package:flutter_news/utils/HttpUtil.dart';
import 'package:flutter_news/widgets/news_list_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewsHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NewsHomePageState();
}

class NewsHomePageState extends State<NewsHomePage>
    with TickerProviderStateMixin {
  var _bannerVisibility = true;
  TabController _tabController;
  NewsHomeArguments newsHomeArguments;
  CategoryEntity _categoryEntity;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<CategoryEntity> getCategoryData() async {
    var response = await HttpUtil()
        .post(Config.getCategoryList, {"id": newsHomeArguments.id});
    if (response.statusCode == 200) {
      _categoryEntity = CategoryEntity().fromJson(response.data);
      return _categoryEntity;
    } else {
      throw Exception("获取栏目失败");
    }
  }

  @override
  Widget build(BuildContext context) {
    newsHomeArguments =
        ModalRoute.of(context).settings.arguments as NewsHomeArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "警务新闻",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, Routes.searchNewsPage,
                    arguments: _categoryEntity);
              },
              iconSize: 20)
        ],
      ),
      body: FutureBuilder(
          future: getCategoryData(),
          builder: (context, data) {
            if (data.hasData) {
              var categoryEntity = data.data as CategoryEntity;
              _tabController = TabController(
                  length: categoryEntity.data.length, vsync: this);
              return Column(
                children: [
                  _buildBanner(),
                  _buildTabBar(categoryEntity),
                  _buildTabBarView(categoryEntity)
                ],
              );
            } else if (data.hasError) {
              Fluttertoast.showToast(
                  msg: "获取数据失败",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  fontSize: 16.0);
              return Text("");
            }
            return CircularProgressIndicator();
          }),
    );
  }

  _buildBanner() => Container(
        height: 200,
        child: Swiper(
          autoplay: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return new Image.network("http://via.placeholder.com/350x150",
                fit: BoxFit.fill);
          },
          onTap: (index) {
            Navigator.pushNamed(context, Routes.newsDetailsPage);
          },
          pagination: new SwiperPagination(),
        ),
      );

  _buildTabBar(CategoryEntity categoryEntity) => Container(
        alignment: Alignment.topLeft,
        height: 40,
        child: TabBar(
          onTap: (tab) => {},
          labelStyle: TextStyle(fontSize: 14, color: Colors.blue),
          unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.blue),
          isScrollable: true,
          controller: _tabController,
          labelColor: Colors.blue,
          indicatorWeight: 2,
          indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.blue,
          tabs: categoryEntity.data.map((e) => Tab(text: e.name)).toList(),
        ),
      );

  _buildTabBarView(CategoryEntity categoryEntity) => Flexible(
        child: TabBarView(
            physics: new NeverScrollableScrollPhysics(),
            controller: _tabController,
            children:
                categoryEntity.data.map((e) => NewsListPage(e.id)).toList()),
        // children: categoryEntity.data.map((e) =>Text("data")).toList()),
      );
}
