import {messageList} from '../components/MessageList'
import {NavigationToolBar} from '../components/NavigationToolBar'
@Entry
@Component
struct MessagePage {
  currentIndex = 3
  build() {
    Column(){
      Column() {
        messageList()
      }
      .width('100%')
      .height('95%').border({width: 1, color:Color.Red})
      NavigationToolBar({ currentIndex: this.currentIndex })
    }
  }
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}