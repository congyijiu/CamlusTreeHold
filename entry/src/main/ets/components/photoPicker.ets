// @ts-nocheck
import picker from '@ohos.file.picker';
import {imageSourceToBase64} from '../utils/imageSourceToBase64';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
@Preview
@Component
export  struct photopicker {
   URI:String = null;
  @State Url:Array<String> = [];
  @State Base64Array:Array<String> = [];
   photoViewPicker = new picker.PhotoViewPicker();
  photoSelectOptions = new picker.PhotoSelectOptions();
  build() {
      Column() {
        Row() {
          ForEach(this.Url, (url) => {
            Image(url)
              .width(100)
              .height(100)
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
        }
        Button('base64')
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

      }

    }


}