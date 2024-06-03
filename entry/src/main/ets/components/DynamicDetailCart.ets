import router from '@ohos.router'

import { dynamicDetailData } from '../viewmodel/TestViewModel'

import DynamicDetail from '../viewmodel/DynamicDetail'


@Preview
@Component
export struct DynamicDetailCart {
  @State private Id: string = '1';
  @State private title: string = 'Hello World';
  @State private imageUri: string = 'https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp,https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp';
  @State dynamicDtail: DynamicDetail = dynamicDetailData;

  onPageShow() {
    console.log(`TestPage onPageShow ${this.dynamicDtail.image_url}`)

  }

  build() {
    Column() {
      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Swiper() {
        ForEach(this.dynamicDtail.image_url, (item: string, index) => {
          if (index == 0) {
            Image(item)
              .width("100%")
              .height(300)
              .syncLoad(true)
              .objectFit(ImageFit.ScaleDown)
              .sharedTransition(`sharedImage${index}`, { duration: 250, curve: Curve.Linear })
          } else {
            Image(item)
              .width("100%")
              .height(300)
              .syncLoad(true)
              .objectFit(ImageFit.ScaleDown)
          }
        })
      }
      .indicatorStyle({ color: '#FF0000', selectedColor: '#00FF00' , bottom: 0})

      Column(){
        Text(this.dynamicDtail.title)
          .fontSize(24)
          .sharedTransition(`title${this.dynamicDtail.id}`, { duration: 250, curve: Curve.Linear })
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

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}