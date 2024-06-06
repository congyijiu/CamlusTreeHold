import router from '@ohos.router'
@Preview
@Component
export struct ChatTap{
  build(){
  Row({space:150}){
  Image($r('app.media.back'))
    .width(25)
    .height(25)
    .margin(10)
    .onClick(()=>{
      router.pushUrl({
        url: 'pages/MessagePage',
      })
    })
    Text("Chat")
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
  }.alignItems(VerticalAlign.Center)
    .width('100%')
    .height(50)
    .alignItems(VerticalAlign.Center)
  }
}