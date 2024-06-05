// @ts-nocheck
import picker from '@ohos.file.picker';
import {imageSourceToBase64} from '../utils/imageSourceToBase64';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import {ImageShow} from '../components/ImageShow';
@Preview
@Component
export  struct photopicker {
   URI:String = null;
  @State Url:Array<String> = [];
  @State Base64Array:Array<String> = [];
  @State title :String = "";
  @State content :String = "";
   photoViewPicker = new picker.PhotoViewPicker();
  photoSelectOptions = new picker.PhotoSelectOptions();
  controller: TextInputController = new TextInputController()
  TextAreaController: TextAreaController = new TextAreaController()
  build() {
      Column() {
        Row() {
          ForEach(this.Url, (url) => {
            ImageShow({ImageUrl:url})
          })
          Text('+')
            .onClick(() => {
              // open the photo picker
              this.photoSelectOptions.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
              this.photoSelectOptions.maxSelectNumber = 5;

              this.photoViewPicker.select(this.photoSelectOptions).then((photoSelectResult) => {
                let i = 0;
                for (i = 0; i < photoSelectResult.photoUris.length; i++) {
                  this.Url[i] = photoSelectResult.photoUris[i];
                }
                console.log('photoViewPicker.select to file succeed and URI is:' + photoSelectResult);
                console.info('photoViewPicker.select to file succeed and URI is:' + JSON.stringify(this.Url[i]));
              }).catch((err) => {
                console.error(`Invoke photoViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
              })

            })
            .width(100)
            .height(100)
            .backgroundColor(Color.White)
            .border({ width: 1, color: Color.Black })
            .fontColor(Color.Black)
            .borderRadius(0)
            .textAlign(TextAlign.Center)
            .fontSize(25)
        }.width('100%').height('20%').alignItems(VerticalAlign.Top)
        TextInput({teext:this.title,placeholder:'请输入标题',controller: this.controller})
          .placeholderColor(Color.Gray)
          .placeholderFont({ size: 14, weight: 400 })
          .width(400)
          .height(40)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .backgroundColor(Color.White)
          .inputFilter('[a-z]', (e) => {
            console.log(JSON.stringify(e))
          })
          .onChange((value: string) => {
            console.log('title: ' + value)
          })
        Divider()
          .vertical(false)
          .width('90%')
        TextArea({text:this.content,placeholder:'请输入内容',controller: this.TextAreaController})
          .width('90%')
          .height(200)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            this.content = value
            console.log('content: ' + value)
          })

        Button('上传图片')
          .onClick(() => {
            for (let index = 0; index < this.Url.length; index++) {
              const element = this.Url[index];
              let file = fs.openSync(element, fs.OpenMode.READ_ONLY);
              console.info('file fd: ' + file.fd);
              let format = 'image/jpeg'
              const imageSource =  image.createImageSource(file.fd)
              imageSourceToBase64(format,imageSource).then((base64) => {
                this.Base64Array[index] = base64;
                console.info('base64: ' + base64);
              }).catch((err) => {
                console.error(`Invoke imageSourceToBase64 failed, code is ${err.code}, message is ${err.message}`);
              })
              fs.closeSync(file);
            }
          })
          .width(200)
        Button('发布帖子')
          .onClick(() => {
            console.info('title: ' + this.title);
            console.info('content: ' + this.content);
            console.info('Base64Array: ' + this.Base64Array);
          })
          .width(200)
          .margin({top:20})
      }.height('89%')

    }


}