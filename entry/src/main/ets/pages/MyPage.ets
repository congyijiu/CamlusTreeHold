import {NavigationToolBar}  from '../components/NavigationToolBar'
import {PersonPageCard} from '../components/PersonalPageCard'
@Entry
@Component
struct MyPage {
  currentIndex: number = 2
  build() {
    Row() {
      Column() {
        PersonPageCard()
        NavigationToolBar({ currentIndex: this.currentIndex })
      }
      .width('100%')
    }
    .height('100%')
  }
}