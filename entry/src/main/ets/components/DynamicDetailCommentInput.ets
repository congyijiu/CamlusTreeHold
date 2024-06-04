
import router from '@ohos.router'
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData} from '../viewmodel/TestViewModel'
import { baseUrl , testtoken , likeimage} from '../common/common'
import { Driver, ON } from '@ohos.UiTest';
import { DynamicDetailReplyButtom } from './DynamicDetailReplyButtom'




@Preview
@Component
export struct DynamicDetailCommentInput {

  @State isvisible:Visibility = Visibility.None

  build(){

    Row(){
      Row(){
        TextArea({placeholder:'说点什么吧...'})
          .width('60%')
          .height(40)
          .fontSize(16)
          .margin({right:10})
          .id('123')
          .onClick(()=>{
            console.info('点击了输入框')
            this.isvisible = Visibility.Visible
          })
          Row(){
            Image(likeimage)
              .width(30)
            Text('60')
              .fontSize(16)
          }
          .width('17%')
          Row(){
            Image(likeimage)
              .width(30)
            Text('60')
              .fontSize(16)
          }
          // .border({
          //   width: {
          //     left: 1,
          //   },
          //   color:'#E8E7E8',
          // })
          .width('20%')
      }
      .backgroundColor('#FFFFFF')
      .margin({top:5})
      .width('100%')
    }

    .backgroundColor('#FFFFFF')
    .width('100%')
    .margin({top:10,bottom:10})
    .height(48)
    .border({
      width: {
        top: 1,
      },
      color:'#E8E7E8',
    })
  }
}