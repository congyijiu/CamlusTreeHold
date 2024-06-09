
import picker from '@ohos.file.picker';
import {imageSourceToBase64} from '../utils/imageSourceToBase64';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import {ImageShow} from '../components/ImageShow';
import {DynamicRequest} from '../api/DynamicRequest';
import promptAction from '@ohos.promptAction';
import router from '@ohos.router'
@Preview
@Component
export  struct photopicker {
   URI:string = null;
  @State Url:Array<string> = [];
    Base64Array:Array<string> = [];
  @State title :string = "";
  @State content :string = "";
   photoViewPicker = new picker.PhotoViewPicker();
  photoSelectOptions = new picker.PhotoSelectOptions();
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
        TextInput({text:this.title,placeholder:'请输入标题'})
          .placeholderColor(Color.Gray)
          .placeholderFont({ size: 14, weight: 400 })
          .width(400)
          .height(40)
          .margin(20)
          .fontSize(14)
          .fontColor(Color.Black)
          .backgroundColor(Color.White)
          .onChange((value: string) => {
            console.log('title: ' + value)
            this.title = value
          })
        Divider()
          .vertical(false)
          .width('90%')
        TextArea({text:this.content,placeholder:'请输入内容'})
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
                this.Base64Array.push(base64);
                console.info('base64: ' + base64);
              }).catch((err) => {
                console.error(`Invoke imageSourceToBase64 failed, code is ${err.code}, message is ${err.message}`);
              })
              fs.closeSync(file);
            }
            promptAction.showToast({
              message: '图片上传成功',
              duration: 2000,
              bottom: 50
            });
          })
          .width(200)
        Button('发布帖子')
          .onClick(() => {
            var dynamicPublishData = {
              title: this.title,
              content: this.content,
              imageUrls: this.Base64Array,
              typeId: 0
            }
            if(this.title == "" || this.content == ""){
              promptAction.showToast({
                message: '信息不完整或图片未上传',
                duration: 2000,
                bottom: 50
              });
              return;
            }
            if(this.Base64Array.length == 0){
              promptAction.showToast({
                message: '请上传图片',
                duration: 2000,
                bottom: 50
              });
              return;
            }
            else {
              DynamicRequest.dynamicPublish(dynamicPublishData)
                .then(() => {
                  console.info('dynamicPublish succeed');
                  promptAction.showToast({
                    message: '发布成功',
                    duration: 2000,
                    bottom: 50
                  });
                })
              router.clear();
              router.pushUrl({
                url: 'pages/MyPage',
                params: {
                  isflush: true
                }
              })
            }
          })
          .width(200)
          .margin({top:20})
      }.height('89%')

    }


}