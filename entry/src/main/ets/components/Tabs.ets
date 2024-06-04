
@Preview
@Component
export struct tabs {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0
  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
    }.width('100%')
  }
  build(){
    Column(){
      Tabs({ barPosition: BarPosition.Start, controller: this.controller })
      {
        ForEach([0, 1, 2, 3, 4], (index:number) => {
          TabContent(){
            //这里设置瀑布流
            //DynamicWaterFlow()
          }.tabBar(this.TabBuilder(index, 'Tab ' + index))
        })
      }.vertical(false)
      .barMode(BarMode.Fixed)
        .barWidth(360)
        .barHeight(56)
        .animationDuration(400)
        .onChange((index: number) => {
          this.currentIndex = index
        })
    }
  }

}
