
import router from '@ohos.router';
@Preview
@Component
export struct SearchHistary {


  build(){
    Column(){
      Row(){
        Text('搜索历史')
          .fontWeight('bold')
          .fontSize(16)
        Blank()
        Text('清空')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Flex({wrap:FlexWrap.Wrap}){
          ForEach(["一本书", "狗", "电动车", "花", "猫", "苹果手机", "房子", "电脑", "学校", "游泳池"],(item,index)=>{
            Text(item)
              .padding(5)
              .fontSize(14)
              .borderRadius(20)
              .borderWidth(1)
              .borderColor('#ccc')
              .margin(5)
          })
      }
      .width('85%')
      .margin({top:5})
    }
    .width('90%')
    .alignItems(HorizontalAlign.Start)
    .margin({top:10,bottom:10})
  }
}