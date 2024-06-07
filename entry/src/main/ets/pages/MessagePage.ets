import router from '@ohos.router'
import { openaiimage } from '../common/common'
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
      Image(openaiimage)
        // .backgroundColor('#f0f0f0')
        .width(40)
        .position({ x: 350, y: 700 })
        .onClick(() => {
          router.pushUrl(
            { url: 'pages/gptSendMessagePage'}
          );
        })

    }
  }
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}