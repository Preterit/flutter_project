/*
* Date:2020/7/29
* author:lwb
* Desc: 时间 相关的util
*/

var currentDate = DateTime.now();

class DateUtil {
  static int MONTH = currentDate.month;
  static int YEAR = currentDate.year;
  static int DAY = currentDate.day;

  static String getZero(int num){
    var result ;
    if(num<10){
      result = "0$num";
    }else{
      result = "$num";
    }
    return result;
  }
}
