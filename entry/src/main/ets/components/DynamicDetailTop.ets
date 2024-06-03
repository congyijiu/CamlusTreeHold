
import router from '@ohos.router'
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData} from '../viewmodel/TestViewModel'



@Preview
@Component
export struct DynamicDetailTop {

  @State dynamicDtail: DynamicDetail = dynamicDetailData;

  build(){
    Row(){
      Image($r('app.media.back'))
        .width(30)
        .margin({left:10,right:10})
        .onClick(() => {
          router.back()
        })
      Image(this.dynamicDtail.avatar)
        .width(35)
        .height(35)
        .borderRadius(50)
      Text(this.dynamicDtail.author)
        .margin({left:10})
        // .border({color:'red',width:1})
        .width(190)
      Button('关注')
        .height(28)
        .backgroundColor('#1BF928')
    }
    .width('100%')
    .margin({top:10,bottom:10})
  }
}