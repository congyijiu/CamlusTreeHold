import {DynamicDetailCart} from '../components/DynamicDetailCart'



@Entry
@Component
struct DynamicDetailPage {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        DynamicDetailCart()
      }
      .width('100%')
    }
    // .height('100%')
  }
}