import {SenderMessage} from '../components/SenderMessage';
import {ReceiverMessage}from '../components/ReceiverMessage'
import {SendMessageInput} from'../components/SendMessageInput'
import {ChatTap} from '../components/ChatTap'
import router from '@ohos.router';
import {webSocketUtil} from '../common/webSocketUtil'
import {MessageRequest} from '../api/MessageRequest'
import MessageDetail from '../viewmodel/MessageDetail';
import { PreferencesUtil } from '../common/PreferencesUtil';
@Entry
@Component
struct SendMessagePage {
  scroller: Scroller = new Scroller()
  @State senderMessage:MessageDetail[] = []
  OtheruserId:number
  username:string
  avatarUrl:string
   MessageDetailData ={
  "acceptUserId":0,
  "index":1,
  "size":10
   }
  myUserId:number
  myavatarUrl:string
   async  aboutToAppear(){
     this.OtheruserId = router.getParams()?.['userId']
     this.username = router.getParams()?.['username']
     this.avatarUrl = router.getParams()?.['avatarUrl']
     this.myUserId = await PreferencesUtil.getPreferenceValue('MyPreferences','id','') as unknown as number
      this.myavatarUrl = await PreferencesUtil.getPreferenceValue('MyPreferences','avatarUrl','') as unknown as string

     webSocketUtil.ws.on('message',(err,value)=>{
       console.log('message',value)
      const acceptMessage = JSON.parse(value)
       let obj = {
         sendTime: null,
         readed: null,
         content: acceptMessage.content,
         type: 'text',
         acceptUserId: null,
         sendUserId: this.OtheruserId,
         id: null,
         delete: null,
         imageBase64: acceptMessage.imageBase64,
       }
       this.senderMessage.push(obj);
       console.log('senderMessage',this.senderMessage)
       this.scroller.scrollEdge(Edge.Bottom)
     })
  }
  async  onPageShow(){
   await this.LoadMessage()
  }
  build() {
      Column() {
        Column(){
          ChatTap({username:this.username})
          Scroll(this.scroller){
            List(){
              ForEach(this.senderMessage,(item)=> {
                ListItem() {
                  Column() {
                    if(item.sendUserId==this.OtheruserId)
                    {
                      ReceiverMessage({senderMessage: item.content,SenderImage:this.avatarUrl,imageBase64:item.imageBase64})
                    }
                    else {
                      SenderMessage({senderMessage: item.content,SenderImage:this.myavatarUrl,imageBase64:item.imageBase64})
                    }

                  }
                  .width('100%')
                }
                .width('100%')

              })

            } .onAreaChange((oldValue: Area, newValue: Area)=>{
              console.log('onAreaChange',JSON.stringify(newValue))
              this.scroller.scrollEdge(Edge.Bottom)
            })
            .backgroundColor('#f0f0f0')
          }.height('87%')
          .width('100%')
          .align(Alignment.TopStart)
          .backgroundColor('#f0f0f0')
          .onScrollEdge((edge: Edge)=>{
            console.log('onScrollEdge',edge)
            if(edge==0){
              this.LoadMoreMessage()
            }
          })
        }
        Column(){
          SendMessageInput({senderMessage:$senderMessage,OtheruserId:this.OtheruserId,myuserId:this.myUserId})
        }
      }
      .width('100%')
    }

  async  LoadMessage()
  {
    this.MessageDetailData.acceptUserId = this.OtheruserId
    MessageRequest.getMessageDetail(this.MessageDetailData).then((res)=>{
      console.log('MessageDetailData',JSON.stringify(res))
      //逆序添加
      res.forEach((item)=>{
        this.senderMessage.unshift(item)
      })
    })
  }
  LoadMoreMessage()
  {
    this.MessageDetailData.acceptUserId = this.OtheruserId
    this.MessageDetailData.index++
    MessageRequest.getMessageDetail(this.MessageDetailData).then((res)=>{
      console.log('MessageDetailData',JSON.stringify(res))
      //逆序添加
      res.forEach((item)=>{
        this.senderMessage.unshift(item)
      })
    })
  }
}