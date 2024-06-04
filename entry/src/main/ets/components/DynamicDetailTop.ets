
import router from '@ohos.router'
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData} from '../viewmodel/TestViewModel'



@Preview
@Component
export struct DynamicDetailTop {

  dynamicDtail: DynamicDetail = dynamicDetailData;

  @State username: string = '';
  @State avatarUrl: string = '';

  aboutToAppear() {
    console.info('DynamicDetailTop aboutToAppear')

    this.username = router.getParams()['username'];
    this.avatarUrl = router.getParams()['avatarUrl'];
  }

  build(){
    Row(){
      Image($r('app.media.back'))
        .width(30)
        .margin({left:10,right:10})
        .onClick(() => {
          router.back()
        })
      Image(this.avatarUrl)
        .width(35)
        .height(35)
        .borderRadius(50)
      Text(this.username)
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