//راجع بدي اتعامل معه response الهدف منه انه انا عندي 
//لاستدعاء api
//<t> يعني اكتر نوع من المعطيات يلي بدها ترجعها
class CommonResponse<T> {
  int? statusCode;
  T? data; //برجع نمط المعطيات يلي بدك ياها
  String? message;

  CommonResponse.fromJson(dynamic json) {
    try{
    this.statusCode = json['statusCode'];

    if (statusCode.toString().startsWith('2')) {
      this.data = json['response'];
    } else {
      if (json['response'] != null && json['response'] is Map
      && json ['response']['title'] !=null
      ) {
        this.message = json['response']['title']; //للاخطاء title:
      } else {
        switch (statusCode) {
          case 400:
            this.message = '400 Bad Request'; //الخطأ من عندي 
            break;
          case 401:
            this.message = '401 UnAuthorized'; 
            break;
          case 404:
            this.message = '404 Not Found';
            break;
          case 500:
            this.message = '500 Internal Server error';
            break;
          case 503:
            this.message = '503  Server unavaliable';
            break;
        }
      }
    }
    }
    catch(e){
      print(e);}
    }
  bool get getStatus => statusCode.toString().startsWith('2');

}

