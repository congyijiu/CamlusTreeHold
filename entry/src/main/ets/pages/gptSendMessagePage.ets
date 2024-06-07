import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'
import {ChatTap} from '../components/ChatTap'

import webSocket from '@ohos.net.webSocket';
import { PreferencesUtil } from '../common/PreferencesUtil'
import { GptSendMessageInput } from '../components/GptSendMessageInput';
import { GptSenderMessage } from '../components/GptMessage';
import GptMessage from '../viewmodel/GptMessage';
import { GptChatTap } from '../components/GptChatTap';
@Entry
@Component
struct gptSendMessagePage {
  scroller: Scroller = new Scroller()

  @State MessageList:GptMessage[] = [
    {
      message:'你好,有什么可以帮你的吗',
      imageBase64:'',
      isSender:0
    }
  ]


  aboutToAppear(){

  }
  build() {
    Column() {
      Column(){
        GptChatTap({MessageList:$MessageList})
        List(){
          ForEach(this.MessageList,(message:any,index:number)=> {
            ListItem() {
              Column() {
                GptSenderMessage({ Message: message })
              }
              .width('100%')
            }
            .width('100%')
          })
        }
        .height('87%')
        .width('100%')
        .backgroundColor(0xDCDCDC)
        .onReachEnd(()=>{
          console.log('3242')
        })
      }
      Column(){
        GptSendMessageInput({MessageList:$MessageList})
      }
    }
    .width('100%')
  }
}