import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'

@Entry
@Component
struct SendMessagePage {

  @State senderMessage:string[] = []
  build() {
      Column() {
        Column(){
          ReceiverMessage()
          ForEach(this.senderMessage,(message:string)=>{
            SenderMessage({senderMessage:$message})
          })
        }.width('100%')
        .height('90%')
        .border({width:1,color:Color.Black})
        Column(){
          SendMessageInput({senderMessage:$senderMessage})
        }
      }
      .width('100%')
    }
}