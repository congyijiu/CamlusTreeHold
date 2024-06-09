import router from '@ohos.router'
import { openaiimage } from '../common/common'
import {messageList} from '../components/MessageList'
import {NavigationToolBar} from '../components/NavigationToolBar'
import {webSocketUtil} from '../common/webSocketUtil'
import {MessageRequest} from '../api/MessageRequest'
import { UserRequest } from '../api/UserRequest'
@Entry
@Component
struct MessagePage {
  currentIndex = 3
  @State userList:any[] = []
  aboutToAppear(){
    //获取消息列表
    var MessageListData ={
      "index": 1,
      "size": 100
    }
    //获取消息列表
    MessageRequest.getMessageList(MessageListData).then((res) => {

      console.log('12312', JSON.stringify(res))
      this.userList = res
      console.log('12312', JSON.stringify( this.userList))
    })
    //监听消息
    webSocketUtil.ws.on('message',(err,data) => {
      const Sender = JSON.parse(data)
      console.log('Sender', JSON.stringify(Sender))
      var repeat = false
      //判断是否重复
      this.userList.forEach((item) => {
        if(item.userId == Sender.sendUserId){
          item.content = Sender.content
          var temp = item
          temp.noreadNum++
          let index = this.userList.indexOf(item)
          this.userList.splice(index,1)
          this.userList.unshift(temp)
          repeat = true
        }
      })
      if(!repeat){
        UserRequest.getOtherInfoById(Sender.sendUserId).then((res) => {
          console.log('res', JSON.stringify(res))
          let ob = {
            userId: Sender.sendUserId,
            username: res.userName,
            avatarUrl: res.avatarUrl,
            type: "text",
            content: Sender.content,
            time: null,
            noreadNum: 1
          }
          this.userList.unshift(ob)
        })
      }
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
      .height('95%')
      .border({width: 1, color:Color.Red})
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
}function getOtherInfoById() {
throw new Error('Function not implemented.')
}
