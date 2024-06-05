
@Preview
@Component
export struct messagetips{
  @State messageCount: number = 1
  build(){
      Text(this.messageCount.toString())
        .backgroundColor(Color.Red)
        .width(20)
        .height(20)
        .fontSize(10)
        .borderRadius(10)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
  }
}