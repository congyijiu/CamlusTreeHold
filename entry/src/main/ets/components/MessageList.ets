import {messagetips} from '../components/MessageTips'
import router from '@ohos.router'
@Preview
@Component
export struct messageList{
  @State url:string = '';
  build(){
    Row(){
      Image(this.url.toString())
        .width(70)
        .height(70)
        .borderRadius(50).backgroundColor(Color.Black)
      Column({space:20}){
        Text('Title')
          .fontSize(20)
        Text('Description')
          .fontSize(15)
          .fontColor(Color.Gray)
      }.padding(10)
      .alignItems(HorizontalAlign.Start)
      Column({space:27}){
        Text('Time')
          .fontSize(10)
          .fontColor(Color.Gray)
        messagetips()
      }.padding(10)
      .width('50%')
      .alignItems(HorizontalAlign.End)
    }.width('100%').onClick(()=>{
          router.pushUrl({
            url:'pages/SendMessagePage'
          })
    })
  }
}