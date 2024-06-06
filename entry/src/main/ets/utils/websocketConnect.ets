import webSocket from '@ohos.net.webSocket';
import { PreferencesUtil } from '../common/PreferencesUtil'

export function webSocketConnect(){
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
