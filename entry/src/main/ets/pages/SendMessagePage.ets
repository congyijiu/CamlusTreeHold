import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'
import {ChatTap} from '../components/ChatTap'

@Entry
@Component
struct SendMessagePage {
  scroller: Scroller = new Scroller()
  @State senderMessage:string[] = []
  build() {
      Column() {
        Column(){
          ChatTap()
          List(){
            ListItem(){
              ReceiverMessage()
            }
            ForEach(this.senderMessage,(message:string)=> {
              ListItem() {
                Column() {
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
          SendMessageInput({senderMessage:$senderMessage})
        }
      }
      .width('100%')
    }
}