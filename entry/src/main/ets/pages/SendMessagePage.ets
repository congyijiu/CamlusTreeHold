import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'
import {ChatTap} from '../components/ChatTap'

import webSocket from '@ohos.net.webSocket';
import { PreferencesUtil } from '../common/PreferencesUtil'
@Entry
@Component
struct SendMessagePage {
  scroller: Scroller = new Scroller()
  @State senderMessage:string[] = []


   aboutToAppear(){
     let ws = webSocket.createWebSocket();
     PreferencesUtil.getPreferenceValue('MyPreferences','id','').then(res=>{
      let userId = res
       console.log('123123324',userId)
       var defaultIpAddress:string = "ws://192.168.31.196:8080/websocket/" +userId;
       console.log('defaultIpAddress',defaultIpAddress)
       ws.connect(defaultIpAddress,(err, value)=>{
         if (!err) {
           console.log("Connected successfully",+value);
         } else {
           console.log("Connection failed. Err:" + JSON.stringify(err));
         }
       })
    })
     let data = {
       acceptUserId: 0,
       type: 'text',
       content: "我还活着"
     }
     let myMessage = JSON.stringify(data)
     //保持连接
     setInterval(function() {
       ws.send(myMessage,(err, value)=>{
         if (!err) {
           console.log("Send message successfully",+value);
         } else {
           console.log("Send message failed. Err:" + JSON.stringify(err));
         }
       })
        }, 15000);

  }
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