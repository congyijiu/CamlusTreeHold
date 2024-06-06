import { DynamicRequest } from '../api/DynamicRequest'
import { SearchTopInput } from '../components/SearchTopInput'
import { WaterFlowTabs } from '../components/WaterFlowTabs'
import DynamicType from '../viewmodel/DynamicType'
import { dynamicTypeList } from '../viewmodel/TestViewModel'


@Entry
@Component
struct SearchPage {


  @State dynamicTypeList:DynamicType[] = dynamicTypeList


  async aboutToAppear(){
    // await DynamicRequest.getAllDynamicType().then((res) => {
    //   console.log('getAllDynamicType' + JSON.stringify(res))
    //   this.dynamicTypeList = res
    //   console.log('aboutToAppear', this.dynamicTypeList)
    // })
  }

  build() {
    Row() {
      Column() {
        SearchTopInput()
        Column(){
          WaterFlowTabs({dynamicTypeList:$dynamicTypeList})
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}