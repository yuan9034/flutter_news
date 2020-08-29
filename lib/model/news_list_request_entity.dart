import 'package:flutter_news/generated/json/base/json_convert_content.dart';

class NewsListRequestEntity with JsonConvert<NewsListRequestEntity> {
  List<int> colIds;
  int pageSize = 10;
  int type = 0;
}
