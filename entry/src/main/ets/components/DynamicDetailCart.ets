import router from '@ohos.router'

import { dynamicDetailData } from '../viewmodel/TestViewModel'

import DynamicDetail from '../viewmodel/DynamicDetail'


@Preview
@Component
export struct DynamicDetailCart {
  @State private Id: string = '1';
  @State dynamicDtail: DynamicDetail = dynamicDetailData;

  aboutToAppear() {
    // console.log(`TestPage onPageShow `)

    this.Id = router.getParams()['id'];
    // console.log(`TestPage onPageShow ${this.Id}`)
  }

  build() {
    Column() {
      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Swiper() {
        ForEach(this.dynamicDtail.image_url, (item: string, index) => {
          if (index == 0) {
            Image(item)
              .syncLoad(true)
              .objectFit(ImageFit.ScaleDown)
              .sharedTransition(`image${this.Id}`, { duration: 250, curve: Curve.Linear })
          } else {
            Image(item)
              .width("100%")
              .height(300)
              .syncLoad(true)
              .objectFit(ImageFit.ScaleDown)
          }
        })
      }
      .width("100%")
      .indicatorStyle({ color: '#FF0000', selectedColor: '#00FF00' , bottom: 0})

      Column(){
        Text(this.dynamicDtail.title)
          .fontSize(24)
          .sharedTransition(`title${this.Id}`, { duration: 250, curve: Curve.Linear })
          .margin({ top: 10 })
          .width("100%")
        Text(this.dynamicDtail.content)
          .fontSize(16)
          .margin({ top: 10 })
          .width("100%")
        Text(this.dynamicDtail.createTime)
          .fontSize(12)
          .margin({ top: 10 })
          .fontColor("#999999")
          .width("100%")
      }
      .width("90%")
    }
    .width("100%")
    .alignItems(HorizontalAlign.Center)
  }


}