import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import {DynamicWaterFlow } from '../components/DynamicWaterFlow'
import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'
import {DynamicRequest} from '../api/DynamicRequest'


@Entry
@Component
struct Index {
  @State minSize: number = 50
  @State maxSize: number = 100


  build() {
    Column(){
      Blank()
        .width('100%')
        .height(50)
      DynamicWaterFlow()
      Blank()
        .width('100%')
        .height(50)
    }
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0})
  }

}