import {NavigationToolBar}  from '../components/NavigationToolBar'

@Entry
@Component
struct MyPage {
  @State message: string = 'Hello World'
  currentIndex: number = 2
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        NavigationToolBar({ currentIndex: this.currentIndex })
      }
      .width('100%')
    }
    .height('100%')
  }
}