import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import {DynamicWaterFlow } from '../components/DynamicWaterFlow'
import { PreferencesUtil } from '../common/PreferencesUtil'

import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'
import {DynamicRequest} from '../api/DynamicRequest'
import { NavigationToolBar } from '../components/NavigationToolBar'
import {WaterFlowTabs} from '../components/WaterFlowTabs';
import { UserRequest } from '../api/UserRequest'
import { formToJSON } from '@ohos/axios'



import DynamicType from '../viewmodel/DynamicType'
import { searchimage } from '../common/common'
import { IndexSearchImage } from '../components/IndexSearchImage'
@Entry
@Component
struct Index {
  @State minSize: number = 50
  @State maxSize: number = 100
  @State testToken : string = ''
  @State str : string = ''
  @State testId: number = 0
  @State datasource: WaterFlowDataSource = new WaterFlowDataSource()
  @State testEmail: string = ''
  @State dynamicTypeList:DynamicType[] = []
  // @State datasource: WaterFlowDataSource = new WaterFlowDataSource()

  // async oninit() {
  //   await DynamicRequest.getAllDynamicType().then((res) => {
  //     console.log('getAllDynamicType' + JSON.stringify(res))
  //     this.dynamicTypeList = res
  //   })
  // }

  async aboutToAppear() {
    await DynamicRequest.getAllDynamicType().then((res) => {
      console.log('getAllDynamicType' + JSON.stringify(res))
      this.dynamicTypeList = res
    })
    // this.datasource.setDataArray(waterFlowData);
    this.testToken = await PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
    console.log('---ling' + this.testToken)
    await UserRequest.getUserInfoByToken(this.testToken).then(async (res) => {
      //res转为Json

      PreferencesUtil.putPreferenceValue('MyPreferences', 'id' , res.id)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'avatarUrl' , res.avatarUrl)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'hobbies' , res.hobbies)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'gender' , res.gender)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'signature' , res.signature)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'phoneNumber' , res.phoneNumber)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'registrationDate' , res.registrationDate)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'email' , res.email)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'username' , res.username)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'follows' , res.follows)
      PreferencesUtil.putPreferenceValue('MyPreferences', 'fans' , res.fans)

      this.testToken = await PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
      this.testId = await PreferencesUtil.getPreferenceValue('MyPreferences','id','') as unknown as number
      this.testEmail = await PreferencesUtil.getPreferenceValue('MyPreferences','email','') as unknown as string
      console.log('---lingjiaTestID' + JSON.stringify(this.testId))
      console.log('---lingjiaTestEmail' + JSON.stringify(this.testEmail))
      console.log('---lingjiaTestToken' + JSON.stringify(this.testToken))
      // console.log('---lingjia' + JSON.stringify(res.data.id))

      // let pageDto = {
      //   pageIndex: 1,
      //   pageSize: 10,
      //   userId: 1
      // }
      // await DynamicRequest.getUserFavoriteDynamicItemById(pageDto).then((res) => {
      //   console.log('---ljf---' + JSON.stringify(res))
      //   // this.datasource.setDataArray(res)
      // })


    })
  }

  build() {
    Column(){
      WaterFlowTabs({dynamicTypeList:$dynamicTypeList})
        .width('100%')
        .height(50)
      // DynamicWaterFlow()
      NavigationToolBar()
        .position({x: 0, y: '95%'})
      IndexSearchImage()
        .position({x: '90%', y: 7})
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