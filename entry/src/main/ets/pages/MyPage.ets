import {NavigationToolBar}  from '../components/NavigationToolBar'
import {PersonPageCard} from '../components/PersonalPageCard'
@Entry
@Component
struct MyPage {
  currentIndex: number = 2

  // onPageShow() {
  //   this.build()
  // }

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
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}