import {NavigationToolBar}  from '../components/NavigationToolBar'
import {PersonPageCard} from '../components/PersonalPageCard'
import router from '@ohos.router'
@Entry
@Component
struct MyPage {
  currentIndex: number = 2
  @State isflush : boolean = false
  aboutToAppear(){
    this.isflush = router.getParams()?.['isflush']
    if(this.isflush){
      router.clear()
    }
  }
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