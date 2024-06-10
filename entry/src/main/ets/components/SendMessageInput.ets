import {webSocketUtil} from '../common/webSocketUtil'
import MessageDetail from '../viewmodel/MessageDetail';
import { phtoimage } from '../common/common';
import picker from '@ohos.file.picker';
import fs from '@ohos.file.fs';
import { imageSourceToBase64 } from '../utils/imageSourceToBase64';
import image from '@ohos.multimedia.image';
@Preview
@Component
export struct SendMessageInput{
  @State myText: string = '';
  @Link senderMessage:MessageDetail[];
  OtheruserId:number
  myuserId:number
  @State imageUrl:string = ''
  @State imageBase64:string = ''
  photoViewPicker = new picker.PhotoViewPicker();
  photoSelectOptions = new picker.PhotoSelectOptions();
  build(){
    Row(){
      Column(){
        Row(){
          TextArea({placeholder:'请输入',text:this.myText})
            .placeholderColor(Color.Grey)
            .placeholderFont({ size: 14, weight: 400 })
            .caretColor(Color.Blue)
            .width(250)
            .height(40)
            .margin(20)
            .fontSize(14)
            .fontColor(Color.Black)
            .border({ width: 1, color: '#f0f0f0' })

            .onChange((value: string) => {
              this.myText = value
            })
            .backgroundColor(Color.White)

          Image(phtoimage)
            .width(30)
            .onClick(() => {
              // open the photo picker
              this.photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
              this.photoSelectOptions.maxSelectNumber = 1;

              this.photoViewPicker.select(this.photoSelectOptions).then((photoSelectResult) => {
                let i = 0;
                for (i = 0; i < photoSelectResult.photoUris.length; i++) {
                  this.imageUrl = photoSelectResult.photoUris[i];
                }
                this.tobase64()
                console.log('photoViewPicker.select to file succeed and URI is:' + photoSelectResult);
                console.info('photoViewPicker.select to file succeed and URI is:' + JSON.stringify(this.imageUrl));
              }).catch((err) => {
                console.error(`Invoke photoViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
              })
            })
          Button('发送')
            .onClick(() => {
              //将myText的值添加到senderMessage数组中
              if (this.myText!=='') {
                let obj = {
                  sendTime: null,
                  readed: null,
                  content: this.myText,
                  type: 'text',
                  acceptUserId: null,
                  sendUserId: this.myuserId,
                  id: null,
                  delete: null,
                  imageBase64:this.imageBase64,
                }
                this.senderMessage.push(obj)
              }
              this.sendMessage()
            })
        }
        .margin({top:5})
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        Row(){
          if (this.imageUrl != '') {
            Image(this.imageUrl)
              .width(150)
              .height(130)
              .objectFit(ImageFit.Contain)
              .onClick(() => {
                console.log('点击图片')
              })
                // .border({ width: 1, color: '#3C3F41' })
              .position({x: 250, y: -300})
            // .border({ width: 1, color: '#3C3F41' })
          }
        }
        .height(150)
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Top)
    .backgroundColor(Color.White)
    .width('100%').height(50)

  }
  sendMessage(){
    let ws = webSocketUtil.ws
    console.log("Send message:" + this.myText)
    let data = {
      acceptUserId: this.OtheruserId,
      type: 'text',
      content: this.myText,
      imageBase64:this.imageBase64
    }
    this.myText = ''
    this.imageUrl = ''
    this.imageBase64 = ''
    let myMessage = JSON.stringify(data)
    console.log("Send message:" + myMessage)
    ws.send(myMessage,(err, value)=>{
      if (!err) {
        console.log("Send message successfully",+value);
      } else {
        console.log("Send message failed. Err:" + JSON.stringify(err));
      }
    })
  }

  tobase64(){
    let file = fs.openSync(this.imageUrl, fs.OpenMode.READ_ONLY);
    console.info('file fd: ' + file.fd);
    let format = 'image/jpeg'
    const imageSource =  image.createImageSource(file.fd)
    imageSourceToBase64(format,imageSource).then((base64) => {
      this.imageBase64 = base64;
      console.info('base64: ' + base64);
    }).catch((err) => {
      console.error(`Invoke imageSourceToBase64 failed, code is ${err.code}, message is ${err.message}`);
    })
    fs.closeSync(file);
  }
}