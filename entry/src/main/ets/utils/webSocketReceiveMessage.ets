import webSocket from '@ohos.net.webSocket';
import { PreferencesUtil } from '../common/PreferencesUtil'

export function  webSocketReceiveMessage():string{
  let ws = webSocket.createWebSocket();
  ws.on('message', (err, value) => {
    console.log("on message, message:" + value);
    // 当收到服务器的`bye`消息时（此消息字段仅为示意，具体字段需要与服务器协商），主动断开连接
    if (value === 'bye') {
      ws.close((err, value) => {
        if (!err) {
          console.log("Connection closed successfully");
        } else {
          console.log("Failed to close the connection. Err: " + JSON.stringify(err));
        }
      });
    }
  });
  return null;
}