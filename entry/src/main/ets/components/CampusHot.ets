
import router from '@ohos.router';
import { DynamicRequest } from '../api/DynamicRequest';
import { hotimage } from '../common/common';
import DynamicItem from '../viewmodel/DynamicItem';

@Preview
@Component
export struct CampusHot {


  @State dynamicItems:DynamicItem[] = []

  @State theCartColor:string = '#FFFFFF'

  commentAnimal(){
    animateTo({
      duration: 150,
      curve: Curve.EaseOut,
      iterations: 1,
      playMode: PlayMode.Normal,
      onFinish: () => {
        this.theCartColor = '#ffffff'
      }
    }, () => {
      this.theCartColor = '#F0F0F0'
    })
  }

  aboutToAppear(){
    console.info('aboutToAppear')

    DynamicRequest.getDynamicTop10().then((res) => {
      console.info('getDynamicTop10',res)
      this.dynamicItems = res
    })
  }

  toDetail(item:DynamicItem){
    console.info('toDetail',JSON.stringify(item))
    router.pushUrl(
      { url: 'pages/DynamicDetailPage',
        params: {
          id: item.id,
          title: item.title,
          imageUrl: item.imageUrl,
          avatarUrl: item.avatarUrl,
          username: item.username,
        }}
    );
  }

  build(){
    Column(){
      Row(){
        Image(hotimage)
          .width(20)
        Text('校园热点')
          .fontWeight('bold')
          .fontSize(16)
          // .fontFamily('sans-serif')
          .fontColor('#315DC3')
        Blank()
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Column(){
        ForEach(this.dynamicItems,(item,index) => {
            Row(){
              Text((index+1).toString())
                .fontSize(14)
                .fontWeight('bold')
                .fontColor('#315DC3')
                .margin({right:5})
                .textAlign(TextAlign.Center)
                .width(20)
              Text(item.title)
              Blank()
            }
            .height(40)
            .border({width:{bottom:1},color:'#F5F5F5'})
            .margin({bottom:5})
            .width('100%')
            .backgroundColor(this.theCartColor)
            .onClick(() => {
              this.toDetail(item)
            })
        })
      }
      .margin({left:10,top:5})
    }
    .width('90%')
    .margin({top:10,bottom:10})
    .alignItems(HorizontalAlign.Start)
  }
}