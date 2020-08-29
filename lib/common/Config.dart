class Config {
  //联网ip跟端口
  static String BASE_URL = "http://192.168.7.40:8090";

  //spider需要的标识
  static String PUB_SN = "e56f168f127740a18d4d546490b2ec92";

  //获取各地市列表
  static String getCitys = "/spider/api/v1/category/list";

  //获取轮播图
  static String getTopTurn = "/spider/api/v1/hnst/col/topTurn";

  //获取当前地市的栏目列表
  static String getCategoryList = "/spider/api/v1/category/col/list";

  //获取该栏目下面的文章列表
  static String getArticleList = "/spider/api/v1/article/list";

  //搜索文章
  static String searchArticle = "/spider/api/v1/article/search";
}
