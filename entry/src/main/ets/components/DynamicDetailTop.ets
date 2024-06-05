
import router from '@ohos.router'
import { DynamicRequest } from '../api/DynamicRequest'
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

    let dynamicId = router.getParams()['id'];

    DynamicRequest.getDynamicDetail(dynamicId).then((res) => {
      console.info('DynamicDetailTop getDynamicDetail', res)
      this.dynamicDtail = res;
    })
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
      if (this.dynamicDtail.isFollow == 1) {
        Button('已关注')
        .height(28)
        .backgroundColor('#C75450')
        .onClick(() => {
          this.dynamicDtail.isFollow = 0;
          console.info('DynamicDetailTop isFollow', this.dynamicDtail.isFollow)
        })
      } else {
      Button('关注')
        .height(28)
        .backgroundColor('#1BF928')
        .onClick(() => {
          this.dynamicDtail.isFollow = 1;
          console.info('DynamicDetailTop isFollow', this.dynamicDtail.isFollow)
        })
      }
    }
    .width('100%')
    .margin({top:10,bottom:10})
  }
}