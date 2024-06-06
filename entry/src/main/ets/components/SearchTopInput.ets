
import router from '@ohos.router';
import { backimage } from '../common/common';
@Preview
@Component
export struct SearchTopInput {

  build(){
    Row(){
      Image(backimage)
        .width(25)
        .onClick(()=>{
          router.back()
        })
      TextInput({placeholder: '请输入搜索内容'})
        .width('80%')
        .height(40)
        .margin({left: 10})
      Blank()
      Text('搜索')
        .fontColor('#75787A')
    }
    .width('90%')
    .justifyContent(FlexAlign.Start)
    .margin({top: 10,bottom: 10})
  }
}