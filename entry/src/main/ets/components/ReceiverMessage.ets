
@Preview
@Component
export struct ReceiverMessage{
  @State SenderImage:String = null;
  @State senderMessage:String = ""
  build(){
    Row(){
      Image(this.SenderImage.toString())
        .width(30)
        .height(30)
        .borderRadius(15)
        .backgroundColor(Color.Black)
      Text(this.senderMessage.toString())
        .backgroundColor("#ADD8E6")
        .padding(6)
        .borderRadius(10)
        .margin({left: 7})
    }.width("100%").justifyContent(FlexAlign.Start)
  }
}