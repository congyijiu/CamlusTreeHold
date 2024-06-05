import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import {DynamicWaterFlow } from '../components/DynamicWaterFlow'
import PreferencesUtil from '../common/PreferencesUtil'

import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'
import {DynamicRequest} from '../api/DynamicRequest'
import { NavigationToolBar } from '../components/NavigationToolBar'
import {tabs} from '../components/Tabs';
import { UserRequest } from '../api/UserRequest'
import { formToJSON } from '@ohos/axios'
@Entry
@Component
struct Index {
  @State minSize: number = 50
  @State maxSize: number = 100
  @State testToken : string = ''
  @State str : string = ''


  @State datasource: WaterFlowDataSource = new WaterFlowDataSource()

  async aboutToAppear() {
    this.datasource.setDataArray(waterFlowData);
    this.testToken = await PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
    console.log('---ling' + this.testToken)
    UserRequest.getUserInfoByToken(this.testToken).then((res) => {
      //res转为Json
      let resJson = formToJSON(res)
      console.log('---ling' + JSON.stringify(res))
    })
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