
@Preview
@Component
export  struct PageTitle{

  build(){
    Row(){
      Text('发布页面').fontSize(20).fontWeight(FontWeight.Bold).margin({left:170})
    }.width('100%').height(50).alignItems(VerticalAlign.Center)
  }
}