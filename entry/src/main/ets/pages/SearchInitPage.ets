import { CampusHot } from '../components/CampusHot'
import { SearchHistary } from '../components/SearchHistary'
import { SearchTopInput } from '../components/SearchTopInput'
@Entry
@Component
struct SearchInitPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        SearchTopInput()
        SearchHistary()
        CampusHot()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFFFFF')
    }
  }
}