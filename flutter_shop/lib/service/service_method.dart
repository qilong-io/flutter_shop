//获得商城首页信息的方法
import 'package:bxshjdemo1/config/service_url.dart';
import 'package:dio/dio.dart';



Future request(url,{formData}) async{

  try{
    print('开始获取$url数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
//    dio.options.responseType = ResponseType.plain;
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else{
      response = await dio.post(servicePath[url],data:formData);
    }
    if(response.statusCode==200){
      print(response);
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }
}



//
Future getHomePageContent() async{

  try{
    print('开始获取首页数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
//    dio.options.responseType = ResponseType.plain;
    var formData = {'lon':'115.02932','lat':'35.76189'};
    response = await dio.post(servicePath['homePageContext'],data:formData);
    if(response.statusCode==200){
      print(response);
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }
}

// 获得火爆专区的商品方法
Future getHomePageBeloConten() async{

  try{
    print('开始获取火爆专区数据...............');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
//    dio.options.responseType = ResponseType.plain;
    int page = 1;
    response = await dio.post(servicePath['homePageBelowConten'],data:page);
    if(response.statusCode==200){
      print(response);
      return response.data;
    }else{
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  }catch(e){
    return print('ERROR:======>${e}');
  }
}

