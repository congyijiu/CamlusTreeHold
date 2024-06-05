import {messageList} from '../components/MessageList'
import {NavigationToolBar} from '../components/NavigationToolBar'
@Entry
@Component
struct MessagePage {
  currentIndex = 3
  build() {
    Row() {
      Column() {
        messageList()

        NavigationToolBar({ currentIndex: this.currentIndex })
      }
      .width('100%')
    }
    .height('100%')
  }
}