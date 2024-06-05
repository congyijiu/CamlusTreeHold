
@Preview
@Component
 export struct SenderMessage{
  @State SenderImage:string = 'null';
@Link senderMessage:string;
  build(){
    Row(){
      Text(this.senderMessage.toString())
        .backgroundColor("#ADD8E6")
        .padding(6)
        .borderRadius(10)
      Image(this.SenderImage.toString())
        .width(30)
        .height(30)
        .borderRadius(15)
        .backgroundColor(Color.Black)
        .margin({left: 7})
    }.width("100%").justifyContent(FlexAlign.End)
  }
}