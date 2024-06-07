import router from '@ohos.router'
import GptMessage from '../viewmodel/GptMessage';
@Preview
@Component
export struct GptChatTap{


  @Link MessageList:GptMessage[];



  build(){
    Row(){
      Image($r('app.media.back'))
        .width(25)
        .height(25)
        .margin({left:15})
        .onClick(()=>{
          router.back()
        })
      Text("Chat")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Text("清空")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({right:15})
        .onClick(()=>{
          this.MessageList = [
            {
              message:'你好,有什么可以帮你的吗',
              imageBase64:'',
              isSender:0
            }
          ]
        })
    }
    .alignItems(VerticalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height(50)
  }
}