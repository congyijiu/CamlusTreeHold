import {webSocketConnect} from '../utils/webSocketConnect'
import {webSocketUtil} from '../common/webSocketUtil'
import GptMessage from '../viewmodel/GptMessage';
import { GptRequest } from '../api/GptRequest';
import { phtoimage } from '../common/common';
import picker from '@ohos.file.picker';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import { imageSourceToBase64 } from '../utils/imageSourceToBase64';


@Preview
@Component
export struct GptSendMessageInput{
  @State myText: string = '';
  @Link MessageList:GptMessage[];
  photoViewPicker = new picker.PhotoViewPicker();
  photoSelectOptions = new picker.PhotoSelectOptions();
  controller: TextInputController = new TextInputController()
  TextAreaController: TextAreaController = new TextAreaController()

  @State imageUrl:string = ''

  @State imageBase64:string = ''


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

  aboutToAppear(){

  }
  build(){
    Row(){
      Column(){
        Row(){
          TextArea({placeholder:'请输入',text:this.myText})
            .placeholderColor(Color.Grey)
              // .placeholderFont({ size: 14, weight: 400 })
            .caretColor(Color.Blue)
            .width(250)
            .height(40)
            .fontSize(14)
            .fontColor(Color.Black)
            .onChange((value: string) => {
              this.myText = value
            })
            .border({ width: 1, color: '#F0F0F0' })
            .backgroundColor(Color.White)
          Image(phtoimage)
            .width(30)
            .onClick(() => {
              // open the photo picker
              this.photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
              this.photoSelectOptions.maxSelectNumber = 5;

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
              .position({x: 250, y: -180})
              // .border({ width: 1, color: '#3C3F41' })
          }
        }
        .height(150)
        // .border({ width: 1, color: '#3C3F41' })
      }
      .width('90%')
      .alignItems(HorizontalAlign.Start)
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(VerticalAlign.Top)
    .backgroundColor(Color.White)
    .width('100%').height(50)
    // .border({ width: 1, color: '#3C3F41' })

  }
  sendMessage(){

    let message:GptMessage = {
      message:this.myText,
      isSender:1,
      imageBase64:this.imageBase64
    }

    this.MessageList.push(message)
    this.myText = ''
    this.imageUrl = ''
    this.imageBase64 = ''
    GptRequest.getGptMessage(message).then((res)=>{
      console.log(res)
      let gptmessage:GptMessage = {
        message:res,
        isSender:0,
        imageBase64:''
      }
      this.MessageList.push(gptmessage)
    })
  }
}