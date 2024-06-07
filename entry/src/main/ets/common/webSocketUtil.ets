import webSocket from '@ohos.net.webSocket';
import {baseUrl} from '../common/common'
export class webSocketUtil{
   static ws = null;
   static connect(id: number){
     console.log('webSocketUtil connect')
     this.ws = webSocket.createWebSocket();
     let userId = id
     console.log('123123324',userId)
     var defaultIpAddress:string = baseUrl +'/websocket/'+ userId;
     console.log('defaultIpAddress',defaultIpAddress)
     webSocketUtil.ws.connect(defaultIpAddress,(err, value)=>{
       if (!err) {
         console.log("Connected successfully",+value);
       } else {
         console.log("Connection failed. Err:" + JSON.stringify(err));
       }
     })
     let data = {
       acceptUserId: 0,
       type: 'text',
       content: "我还活着"
     }
     let myMessage = JSON.stringify(data)
     //保持连接
     setInterval(function() {
       webSocketUtil.ws.send(myMessage,(err, value)=>{
         if (!err) {
           console.log("Send message successfully",+value);
         } else {
           console.log("Send message failed. Err:" + JSON.stringify(err));
         }
       })
     }, 15000);
   }
}