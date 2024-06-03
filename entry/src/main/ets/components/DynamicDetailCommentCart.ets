import audio from '@ohos.multimedia.audio';
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import {dynamicDetailCommentData} from '../viewmodel/TestViewModel'




@Preview
@Component
export struct DynamicDetailCommentCart {

  @State DynamicDetailComponentData: DynamicDetailComment = dynamicDetailCommentData;
  @State test: number = 1;

  getLikeCount(likeCount:Number){
    return likeCount as unknown as string
  }
  onPageShow(){
    console.info('onPageShow',this.test)
  }

  build() {
    Row(){
      Column(){

          Image(this.DynamicDetailComponentData.user.avatarUrl)
            .borderRadius(50)
            .width(25)
            .height(25)
          // Blank()
            // .border({color:'red',width:1})
      }
      .width('7%')
      // .border({color:'red',width:1})
      // .border({color: 'red', width: 1})
      Column(){
        Row(){
          Column(){
            Column(){
              Text(this.DynamicDetailComponentData.user.username)
                .fontColor('#3C3F41')
                .width('100%')
                .fontSize(10)
              Text(this.DynamicDetailComponentData.content)
                .fontSize(12)
                .width('100%')
                .margin({top:5})
              Text(this.DynamicDetailComponentData.createTime)
                .fontSize(10)
                .fontColor('#45494A')
                .width('100%')
                .margin({top:5})
            }
            .width('95%')
          }
          .width('86%')
          // .border({color: 'red', width: 1})
          Column(){
            Image($r('app.media.ic_public_favor'))
              .width(16)
              .margin({top:5})
            Text(this.DynamicDetailComponentData.likeCount.toString())
              .fontSize(10)
          }
          .width('7%')
          // .border({color: 'red', width: 1})
        }
        .alignItems(VerticalAlign.Top)
        if (this.test == 1) {
          DynamicDetailCommentCart({test:0})
          DynamicDetailCommentCart({test:0})
          DynamicDetailCommentCart({test:0})
          DynamicDetailCommentCart({test:0})
        }
      }
    }
    .margin({top:5})
    // .border({color:'blue',width:1})
    .width('90%')
    .alignItems(VerticalAlign.Top)
  }
}