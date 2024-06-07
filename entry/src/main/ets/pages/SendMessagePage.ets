import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'
import {ChatTap} from '../components/ChatTap'
import router from '@ohos.router';
import {webSocketUtil} from '../common/webSocketUtil'
import {MessageRequest} from '../api/MessageRequest'
@Entry
@Component
struct SendMessagePage {
  scroller: Scroller = new Scroller()
  @State senderMessage:string[] = []
  OtheruserId:number
  username:string
  avatarUrl:string
   aboutToAppear(){
     this.OtheruserId = router.getParams()?.['userId']
     this.username = router.getParams()?.['username']
     this.avatarUrl = router.getParams()?.['avatarUrl']
     webSocketUtil.ws.on('message',(err,value)=>{

     })
  }
  build() {
      Column() {
        Column(){
          ChatTap({username:this.username})
          List(){
            ListItem(){
              ReceiverMessage()
            }
            ForEach(this.senderMessage,(message:string)=> {
              ListItem() {
                Column() {
                  // if()
                  // {
                  //
                  // }
                  SenderMessage({ senderMessage: message })
                }
                .width('100%')
              }
              .width('100%')

            })
          }.height('80%')
          .width('100%')
          .backgroundColor(0xDCDCDC)
          .onReachEnd(()=>{
            console.log('3242')
          })
        }
        Column(){
          SendMessageInput({senderMessage:$senderMessage,OtheruserId:this.OtheruserId})
        }
      }
      .width('100%')
    }
}