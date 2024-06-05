
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
  @Link teststring: string;

  build(){

    Row(){
      Row(){
        TextArea({placeholder:`${this.teststring}`})
          .width('60%')
          .height(40)
          .fontSize(16)
          .margin({right:10})
          .id('123')
          .onBlur(()=>{
            console.info('TextArea onBlur')
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