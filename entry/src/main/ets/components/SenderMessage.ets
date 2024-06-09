
@Preview
@Component
 export struct SenderMessage{
  @State SenderImage:string = 'null';
  @State senderMessage:string = 'null';
  @State imageBase64:string = 'null';
  build(){
    Row(){
      Column(){
        Flex({ direction: FlexDirection.RowReverse }){
          Text(this.senderMessage)
            .backgroundColor("#ADD8E6")
            .padding(6)
            .borderRadius(10)
            .textOverflow({ overflow:TextOverflow.None })
            .margin({top: 7})
          if (this.imageBase64 != 'null'){
            Image(this.imageBase64)
              .width(150)
                // .height(150)
              .objectFit(ImageFit.Contain)
              .borderRadius(10)
              .margin({ top: 0 })
          }
        }
      }
      .borderRadius(10)
      .margin({top: 10})
      .backgroundColor("#ADD8E6")
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