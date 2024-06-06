import {webSocketConnect} from '../utils/webSocketConnect'
import {webSocketUtil} from '../common/webSocketUtil'

@Preview
@Component
export struct SendMessageInput{
  @State myText: string = '';
  @Link senderMessage:string[];

  aboutToAppear(){
    //连接websocket
    webSocketConnect()
  }
  build(){
    Row(){
      TextArea({placeholder:'请输入',text:this.myText})
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(300)
        .height(40)
        .margin(20)
        .fontSize(14)
        .fontColor(Color.Black)
        .inputFilter('[a-z]', (e) => {
          console.log(JSON.stringify(e))
        })
        .onChange((value: string) => {
          this.myText = value
        })
        .backgroundColor(Color.White)
      Button('发送')
        .onClick(() => {
          //将myText的值添加到senderMessage数组中
          if (this.myText!=='') {
            this.senderMessage.push(this.myText)
          }
          this.sendMessage()
          this.myText = ''
        })
    }.width('100%').height(100).backgroundColor(0xDCDCDC)

  }
  sendMessage(){
    let ws = webSocketUtil.ws
    console.log("Send message:" + this.myText)
    let data = {
      acceptUserId: 1,
      type: 'text',
      content: this.myText
    }
    let myMessage = JSON.stringify(data)
    console.log("Send message:" + myMessage)
    ws.send(myMessage,(err, value)=>{
      if (!err) {
        console.log("Send message successfully",+value);
      } else {
        console.log("Send message failed. Err:" + JSON.stringify(err));
      }
    })
  }
}