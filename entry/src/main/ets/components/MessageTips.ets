
@Preview
@Component
export struct messagetips{
  @State messageCount: number = 0
  @State isShow: Visibility = Visibility.Hidden
  aboutToAppear(){
    if (this.messageCount != 0) {
      this.isShow = Visibility.Visible
    }
    else {
      this.isShow = Visibility.Hidden
    }
  }
  build(){
      Text(this.messageCount.toString())
        .backgroundColor(Color.Red)
        .width(20)
        .height(20)
        .fontSize(10)
        .borderRadius(10)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .visibility(this.isShow)
  }
}