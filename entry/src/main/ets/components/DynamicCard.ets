
import router from '@ohos.router';
import DynamicItem from '../viewmodel/DynamicItem';
import {waterFlowData} from '../viewmodel/TestViewModel';
import {likeimage,like1image} from '../common/common';
import { DynamicRequest } from '../api/DynamicRequest';



@Preview
@Component
export struct DynamicCard {


  @State dynamicItem: DynamicItem = waterFlowData[0];

  @State isLiked: number = 0;


  aboutToAppear(){
    console.log('DynamicCard aboutToAppear');
    this.isLiked = this.dynamicItem.isLike;
    console.log('DynamicCard aboutToAppear', this.isLiked);
  }

  onPageShow(){
    console.log('DynamicCard onPageShow');
  }

  build(){
    Column(){
      Image(this.dynamicItem.imageUrl)
        .sharedTransition(`image${this.dynamicItem.id}`, { duration: 200, curve: Curve.Linear })
        .width('100%')
        .borderRadius(5)
        .syncLoad(true)
      Text(this.dynamicItem.title)
        // .sharedTransition(`title${this.dynamicItem.id}`, { duration: 200, curve: Curve.Linear })
        .fontSize(14)
        .fontWeight('bold')
        .fontColor('#000000')
        .width('90%')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 5, bottom: 5 })
      Row(){
        Image(this.dynamicItem.avatarUrl)
          .width(20)
          .height(20)
          .borderRadius(25)
          .border({ width: 1, color: '#AFB1B3' })
        Text(`${this.dynamicItem.username}`)
          .fontSize(12)
          .fontColor('#3C3F41')
          .margin({left: 5})
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          // .border({ width: 1, color: '#000000' })
          .width('65%')
        Blank()
        Row(){
          if (this.dynamicItem.isLike == 0 || this.dynamicItem.isLike == null){
            Image(likeimage)
              .width(18)
              .onClick(() => {
                this.dynamicItem.isLike = 1;
                this.dynamicItem.likeCount += 1;
                let dynamicActionDto ={
                  dynamicId: this.dynamicItem.id,
                  islike: 1,
                  isfavorite: null
                }
                DynamicRequest.userDynamicActions(dynamicActionDto)
              })
          }else{
            Image(like1image)
              .width(18)
              .onClick(() => {
                this.dynamicItem.isLike = 0;
                this.dynamicItem.likeCount -= 1;
                let dynamicActionDto ={
                  dynamicId: this.dynamicItem.id,
                  islike: 0,
                  isfavorite: null
                }
                DynamicRequest.userDynamicActions(dynamicActionDto)
              })
          }
          Text(`${this.dynamicItem.likeCount}`)
            .fontSize(12)
            .fontColor('#3C3F41')
            .margin({left: 5})
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            // .border({ width: 1, color: '#000000' })
        }
      }
      .width('90%')
      // .border({ width: 1, color: '#000000' })
    }
    .width(197)
    .justifyContent(FlexAlign.Center)
    .margin({ top: 3, bottom: 3})
    .backgroundColor('#FFFFFF')
    .onClick(() => {
      console.log('DynamicCard onClick', this.dynamicItem.id);
      router.pushUrl(
        { url: 'pages/DynamicDetailPage',
          params: {
            id: this.dynamicItem.id,
            title: this.dynamicItem.title,
            imageUrl: this.dynamicItem.imageUrl,
            avatarUrl: this.dynamicItem.avatarUrl,
            username: this.dynamicItem.username,
          }}
      );
    })
  }
}