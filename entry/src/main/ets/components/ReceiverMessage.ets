
@Preview
@Component
export struct ReceiverMessage{
  @State SenderImage:string = '';
  @State senderMessage:string = ""
  @State imageBase64:string = ""
  build(){
    Row(){
      Image(this.SenderImage)
        .width(40)
        .height(40)
        .borderRadius(20)
        .backgroundColor(Color.Black)
        .margin({left: 7,right: 7,top:10})

        Flex({ direction: FlexDirection.RowReverse }) {
          Column(){
          Text(this.senderMessage)
            .backgroundColor(Color.White)
            .padding(6)
            .borderRadius(10)
            .margin({ left: 7 })
          if (this.imageBase64 != "") {
            Image(this.imageBase64)
              .width(150)
                // .height(150)
              .objectFit(ImageFit.Contain)
              .borderRadius(10)
              .margin({ top: 0 })
          }
        }.borderRadius(10)
          .margin({top: 10})
          .backgroundColor("#ADD8E6")
      }
      .width("70%")


    }.width("100%").justifyContent(FlexAlign.Start)
  }
}