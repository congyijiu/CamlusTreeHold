import { SearchTopInput } from '../components/SearchTopInput'
import { WaterFlowTabs } from '../components/WaterFlowTabs'


@Entry
@Component
struct SearchPage {
  build() {
    Row() {
      Column() {
        SearchTopInput()
      }
      .width('100%')
    }
    .height('100%')
  }
}