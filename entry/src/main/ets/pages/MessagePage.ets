import {messageList} from '../components/MessageList'
import {NavigationToolBar} from '../components/NavigationToolBar'
import {webSocketUtil} from '../common/webSocketUtil'
import {MessageRequest} from '../api/MessageRequest'
@Entry
@Component
struct MessagePage {
  currentIndex = 3
  @State userList:any = []
  aboutToAppear(){
    //监听消息
    webSocketUtil.ws.on('message', (err,data) => {
      console.log('message', JSON.stringify(data))
    })
   //获取消息列表
    var MessageListData ={
      "index": 1,
      "size": 100
    }
    MessageRequest.getMessageList(MessageListData).then((res) => {
      console.log('12312', JSON.stringify(res))
      this.userList = res
      console.log('12312', JSON.stringify( this.userList))
    })

  }
  build() {
    Column(){
      Column() {
        ForEach(this.userList, (item) => {
          messageList({userItem: item})
        })

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