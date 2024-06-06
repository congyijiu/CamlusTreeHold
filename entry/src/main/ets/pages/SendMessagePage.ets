import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'
import {ChatTap} from '../components/ChatTap'

@Entry
@Component
struct SendMessagePage {
  @State senderMessage:string[] =[];
  build() {
      Column() {
        Column(){
          ChatTap()
          Scroll(){
            Column(){
              ReceiverMessage()
              ForEach(this.senderMessage,(message:string)=>{
                SenderMessage({senderMessage:message})
              })
            }.width('100%')
            .border({width:1,color:Color.Black})
            .height('80%')
          }
        }
        Column(){
          SendMessageInput({senderMessage:$senderMessage})
        }
      }
      .width('100%')
    }
}