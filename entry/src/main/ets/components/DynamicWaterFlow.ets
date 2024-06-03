import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'


@Preview
@Component
export struct DynamicWaterFlow {
  @State datasource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()

  aboutToAppear() {
    this.datasource.setDataArray(waterFlowData);
  }

  build() {
    WaterFlow({ scroller: this.scroller }) {
      LazyForEach(this.datasource, (item: DynamicItem) => {
        FlowItem() {
          DynamicCard({ dynamicItem: item })
        }
      }, (item: DynamicItem) => JSON.stringify(item))

    }
    .onReachEnd(() => {
      console.info('onReachEnd1')
      this.datasource.addDataArray(waterFlowData)
      console.info('onReachEnd2')
    })
    .layoutWeight(1)
    .layoutDirection(FlexDirection.Column)
    .columnsTemplate('1fr 1fr')
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}