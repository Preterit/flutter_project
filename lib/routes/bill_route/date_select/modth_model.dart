/*
* Date:2020/7/29
* author:lwb
* Desc:
*/

import 'package:flutterproject/util/date_util.dart';

var billTopData = {
  "selectMonth": 0,
  "selectYear": DateUtil.YEAR,
};

var billMonthList = [
  {"selectYear": 2009},
  {"selectYear": 2010},
  {"selectYear": 2011},
  {"selectYear": 2012},
  {"selectYear": 2013},
  {"selectYear": 2014},
  {"selectYear": 2015},
  {"selectYear": 2016},
  {"selectYear": 2017},
  {"selectYear": 2018},
  {"selectYear": 2019},
  {"selectYear": 2020},
];

class DateItemBean {
  int year;

  int month;

  DateItemBean(this.year, this.month);
}
