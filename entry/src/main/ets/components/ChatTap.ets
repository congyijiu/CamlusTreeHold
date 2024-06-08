import router from '@ohos.router'
@Preview
@Component
export struct ChatTap{
  @State username:string = 'awa'
  build(){
  Row(){
  Image($r('app.media.back'))
    .width(25)
    .margin({left:10})
    .onClick(()=>{
      router.replaceUrl({
        url: 'pages/MessagePage',
      })
    })
    Text(this.username)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
    Image('')
      .width(25)
      .margin({right:10})
      // .border({width:1,color:'#000000'})
  }
    .alignItems(VerticalAlign.Center)
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}