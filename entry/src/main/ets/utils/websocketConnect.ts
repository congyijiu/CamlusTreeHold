import webSocket from '@ohos.net.webSocket';

export function websocketConnect(onMessage: (data: string) => void) {
  var defaultIpAddress = "ws://http://192.168.31.196:8080/websocket/";
  let ws = webSocket.createWebSocket();
  ws.connect(defaultIpAddress)

}
