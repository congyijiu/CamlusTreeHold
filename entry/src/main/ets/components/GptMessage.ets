
import { like1image, likeimage } from '../common/common';
import GptMessage from '../viewmodel/GptMessage';
@Preview
@Component
export struct GptSenderMessage{
  @State SenderImage:string = 'null';
  @State Message:GptMessage = {
    message: '',
    isSender: 0,
    imageBase64: ''
  };
  @State isSender:number = 0;

  @State messagestr:string = '';

  @State Flextest:FlexAlign = FlexAlign.End

  @State Flextest2:FlexAlign = FlexAlign.Start


  aboutToAppear(){
    this.messagestr = this.Message.message;
    this.isSender = this.Message.isSender;
    if (this.isSender == 1) {
      this.Flextest = FlexAlign.End
      this.Flextest2 = FlexAlign.Start
    } else {
      this.Flextest = FlexAlign.Start
      this.Flextest2 = FlexAlign.End
    }
  }

  build(){
    Row(){
      if (this.isSender == 0) {
        Image(likeimage)
          .width(40)
          .height(40)
          .borderRadius(20)
          .border({color: '#F0F0F0', width: 1})
          // .backgroundColor(Color.Black)
          .margin({left: 7,top:3,right: 7})
      }
      Flex({ direction: FlexDirection.RowReverse, justifyContent:this.Flextest2 }){
        Column(){
          Text(this.messagestr)
            .padding(6)
            .borderRadius(10)
            .textOverflow({ overflow:TextOverflow.None })
            // .margin({top: 14})
          if (this.Message.imageBase64 != '') {
            Image(this.Message.imageBase64)
              .width(100)
              .height(100)
              .borderRadius(10)
              .margin({ top: 0 })
          }
        }
        .borderRadius(10)
        .margin({top: 10})
        .backgroundColor("#ADD8E6")
      }
      // .border({color: Color.Black, width: 1})
      .width('70%')
      if (this.isSender == 1) {
        Image(like1image)
          .width(40)
          .height(40)
          .borderRadius(20)
          .border({color: '#F0F0F0', width: 1})
          // .backgroundColor(Color.Black)
          .margin({left: 7,top:3,right: 7})
      }
    }
    .width('100%')
    .justifyContent(this.Flextest)
    .alignItems(VerticalAlign.Top)
    .margin({top: 10})
    // .border({color: Color.Black, width: 1})

  }
}