import router from '@ohos.router'

import { dynamicDetailData } from '../viewmodel/TestViewModel'

import DynamicDetail from '../viewmodel/DynamicDetail'
import {DynamicRequest} from '../api/DynamicRequest'







@Preview
@Component
export struct DynamicDetailCart {
  @State private Id: string = '1';
  @State imageUrl: string = '';
  @State title: string = '';
  @State dynamicDtail: DynamicDetail = dynamicDetailData;

  aboutToAppear() {
    this.Id = router.getParams()['id'];
    this.imageUrl = router.getParams()['imageUrl'];
    this.title = router.getParams()['title'];
    DynamicRequest.getDynamicDetail(this.Id).then((res) => {
      this.dynamicDtail = res;
      console.info('getDynamicDetail', res);
    })
  }

  build() {
    Column() {
      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Swiper() {
        ForEach(this.dynamicDtail.imageUrlList, (item: string, index) => {
          if (index == 0) {
            Image(this.imageUrl)
              .syncLoad(true)
              .objectFit(ImageFit.Cover)
              .sharedTransition(`image${this.Id}`, { duration: 250, curve: Curve.Linear })
          } else {
            Image(item)
              .width("100%")
              .height(300)
              .syncLoad(true)
              .objectFit(ImageFit.Cover)
          }
        })
      }
      .width("100%")
      .indicatorStyle({ color: '#FF0000', selectedColor: '#00FF00' , bottom: 0})

      Column(){
        Text(this.title)
          .fontSize(24)
          .sharedTransition(`title${this.Id}`, { duration: 250, curve: Curve.Linear, type: SharedTransitionEffectType.Static })
          .margin({ top: 10 })
          .width("100%")
        Text(this.dynamicDtail.content)
          .fontSize(16)
          .margin({ top: 10 })
          .width("100%")
        Text(this.dynamicDtail.postDate)
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