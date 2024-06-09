import {messagetips} from '../components/MessageTips'
import router from '@ohos.router'
@Preview
@Component
export struct messageList{
  @State userItem:any = {};
  build(){
    Row(){
      Image(this.userItem.avatarUrl)
        .width(70)
        .height(70)
        .borderRadius(50)
      Column({space:20}){
        Text(this.userItem.username)
          .fontSize(20)
        Text(this.userItem.content)
          .fontSize(15)
          .fontColor(Color.Gray)
      }.padding(10)
      .alignItems(HorizontalAlign.Start)
        Text(this.userItem.sendTime)
          .fontSize(10)
          .fontColor(Color.Gray)
          .position({x:340,y:10})
        messagetips({messageCount:this.userItem.noreadNum})
          .position({x:370,y:50})
    }.width('100%').onClick(()=>{
          router.pushUrl({
            url:'pages/SendMessagePage',
            params:{
              userId:this.userItem.userId,
              username:this.userItem.username,
              avatarUrl:this.userItem.avatarUrl
            }
          })
    })
  }
}