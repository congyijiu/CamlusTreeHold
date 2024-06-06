import DynamicType from '../viewmodel/DynamicType'
import { DynamicWaterFlow } from './DynamicWaterFlow'
import { UserDynamicWaterFlow } from './UserDynamicWaterFlow'
import { UserPublishDynamicWaterFlow } from './UserPublishWaterFlow'

@Preview
@Component
export struct UserWaterFlowTabs {
  @State fontColor: string = '#182431'
  @State selectedFontColor: string = '#007DFF'
  @State currentIndex: number = 0

  @Link dynamicTypeList:DynamicType[];

  private controller: TabsController = new TabsController()

  @Builder TabBuilder(index: number, name: string) {
    Column() {
      Text(name)
        .fontColor(this.currentIndex === index ? this.selectedFontColor : this.fontColor)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
          // .lineHeight(16)
        .margin({ top: 7, bottom: 7 })
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
        // ForEach(this.dynamicTypeList, (item:DynamicType,index:number) => {

          TabContent(){
            //这里设置瀑布流
            UserPublishDynamicWaterFlow({type:parseInt('0')})
          }.tabBar(this.TabBuilder(0, '用户动态'))

          TabContent(){
            //这里设置瀑布流
            UserDynamicWaterFlow({type:parseInt('1')})
          }.tabBar(this.TabBuilder(1, '用户收藏'))

        // })
      }
      .vertical(false)
      .height(790)
      .barMode(BarMode.Fixed)
      .barWidth(300)
      .barHeight(40)
      .border({ color: '#E5E5E5', width: 1 })
      .scrollable(true)
      .animationDuration(300)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
  }

}
