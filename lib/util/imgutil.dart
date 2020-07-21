/*
* Date:2020/7/21
* author:lwb
* Desc: 拼接完整的本地图片路径url
*/

class Img {
  /*
   * 获取 3.0x 2.0x 图片资源
   */
  static allUrl(String imgName) {
    assert(imgName != null);
    return "assets/images/" + imgName;
  }

  /*
   * 获取  assets/images/ 下面 'loadgif' 文件夹下面的图片 url
   */
  static getLoadgifFileUrl(String imgName) {
    assert(imgName != null);
    return "assets/images/loadgif" + imgName;
  }
}
