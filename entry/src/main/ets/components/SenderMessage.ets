
@Preview
@Component
 export struct SenderMessage{
  @State SenderImage:string = 'null';
  @State senderMessage:string = 'null';
  build(){
    Row(){
      Flex({ direction: FlexDirection.RowReverse }){
        Text(this.senderMessage)
          .backgroundColor("#ADD8E6")
          .padding(6)
          .borderRadius(10)
          .textOverflow({ overflow:TextOverflow.None })
          .margin({top: 7})
      }
      Image(this.SenderImage)
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(Color.Black)
        .margin({left: 7,top:3,right: 7})
    }
    .width(300)
    .justifyContent(FlexAlign.End)
    .alignItems(VerticalAlign.Top)
    .margin({top: 10})
    // .height(40)
  }
}