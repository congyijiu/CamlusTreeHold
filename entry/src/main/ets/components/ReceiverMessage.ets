
@Preview
@Component
export struct ReceiverMessage{
  @State SenderImage:string = '';
  @State senderMessage:string = "hello"
  build(){
    Row(){
      Image(this.SenderImage.toString())
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(Color.Black)
        .margin({left: 7,right: 7})
      Text(this.senderMessage.toString())
        .backgroundColor("#ADD8E6")
        .padding(6)
        .borderRadius(10)
        .margin({left: 7})
    }.width("100%").justifyContent(FlexAlign.Start)
  }
}