
import router from '@ohos.router';
import { hotimage } from '../common/common';

@Preview
@Component
export struct CampusHot {

  build(){
    Column(){
      Row(){
        Image(hotimage)
          .width(20)
        Text('校园热点')
          .fontWeight('bold')
          .fontSize(16)
          // .fontFamily('sans-serif')
          .fontColor('#315DC3')
        Blank()
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Column(){
        ForEach([
          "新生入学典礼",
          "运动会",
          "校园招聘会",
          "毕业典礼",
          "社团招新",
          "学术讲座",
          "校园歌手大赛",
          "科技创新大赛",
          "迎新晚会",
          "期末考试",
        ],(item,index) => {
            Row(){
              Text((index+1).toString())
                .fontSize(14)
                .fontWeight('bold')
                .fontColor('#315DC3')
                .margin({right:5})
                .textAlign(TextAlign.Center)
                .width(20)
              Text(item)
              Blank()
            }
            .height(30)
            .border({width:{bottom:1},color:'#F5F5F5'})
            .margin({bottom:5})
            .width('100%')
        })
      }
      .margin({left:10,top:5})
    }
    .width('90%')
    .margin({top:10,bottom:10})
    .alignItems(HorizontalAlign.Start)
  }
}