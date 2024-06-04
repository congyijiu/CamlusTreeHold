
import router from '@ohos.router';
import DynamicItem from '../viewmodel/DynamicItem';
import {waterFlowData} from '../viewmodel/TestViewModel';



@Preview
@Component
export struct DynamicCard {


  @State dynamicItem: DynamicItem = waterFlowData[0];


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
        .sharedTransition(`title${this.dynamicItem.id}`, { duration: 200, curve: Curve.Linear })
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
          .width('70%')
        Blank()
      }
      .width('90%')
      // .border({ width: 1, color: '#000000' })
    }
    .width(190)
    .justifyContent(FlexAlign.Center)
    .margin({ top: 5, bottom: 5})
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