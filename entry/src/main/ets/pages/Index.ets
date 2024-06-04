import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import {DynamicWaterFlow } from '../components/DynamicWaterFlow'

import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'
import {DynamicRequest} from '../api/DynamicRequest'
import { NavigationToolBar } from '../components/NavigationToolBar'
import {tabs} from '../components/Tabs';
@Entry
@Component
struct Index {
  @State minSize: number = 50
  @State maxSize: number = 100

  @State datasource: WaterFlowDataSource = new WaterFlowDataSource()

  aboutToAppear() {
    this.datasource.setDataArray(waterFlowData);
  }

  build() {
    Column(){
      tabs()
        .width('100%')
        .height(50)

      // Blank()
      //   .width('100%')
      //   .height(50)
      DynamicWaterFlow()
      NavigationToolBar()
    }

  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0})
  }

  test() {
    router.pushUrl(
      { url: 'pages/testPage' },
      router.RouterMode.Single,
      err => {
        console.log('pushUrl err', err)
      }
    );
    console.log('mounted')
  }

}