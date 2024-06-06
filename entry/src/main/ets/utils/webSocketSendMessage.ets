import webSocket from '@ohos.net.webSocket';
import { PreferencesUtil } from '../common/PreferencesUtil'

export function webSocketSendMessage(Message: string) {
  let ws = webSocket.createWebSocket();
  let data = {
    acceptUserId: 0,
    type: 'text',
    content: Message,
  }
  let myMessage = JSON.stringify(data)
    ws.send(myMessage,(err, value)=>{
      if (!err) {
        console.log("Send message successfully",+value);
      } else {
        console.log("Send message failed. Err:" + JSON.stringify(err));
      }
    })

}