import {messagetips} from '../components/MessageTips'
@Preview
@Component
export struct messageList{
  url = null
  build(){
    Row(){
      Image(this.url)
        .width(90)
        .height(90)
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
      .width('40%')
      .alignItems(HorizontalAlign.End)
    }.width('100%')
  }
}