import { SearchTopInput } from '../components/SearchTopInput'


@Entry
@Component
struct SearchPage {
  build() {
    Row() {
      Column() {
        SearchTopInput()
        Tabs()
      }
      .width('100%')
    }
    .height('100%')
  }
}