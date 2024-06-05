
import router from '@ohos.router'
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData} from '../viewmodel/TestViewModel'
import { baseUrl , testtoken , likeimage} from '../common/common'
import { Driver, ON } from '@ohos.UiTest';




@Preview
@Component
export struct DynamicDetailReplyButtom {

  build(){
    Row(){
      Row(){
        Row(){
          Text('说点什么吧...')
            .borderRadius(20)
            .width('40%')
            .margin({left:20})
            .fontColor('#C0C0C0')
        }
        .height(30)
        .borderRadius(20)
        .backgroundColor('#F5F5F5')
        Blank()
        Row(){
          Image(likeimage)
            .width(30)
          Text('60')
            .fontSize(16)
        }
        .margin({right:10})
        Row(){
          Image(likeimage)
            .width(30)
          Text('60')
            .fontSize(16)
        }
        .margin({right:10})
        Row(){
          Image(likeimage)
            .width(30)
          Text('60')
            .fontSize(16)
        }
        .margin({right:10})
      }
      .margin({top:5})
      .width('100%')
    }
    .backgroundColor('#FFFFFF')
    .width('100%')
    .margin({top:10,bottom:10})
    .height(45)
    .border({
      width: {
        top: 1,
      },
      color:'#E8E7E8',
    })
  }
}