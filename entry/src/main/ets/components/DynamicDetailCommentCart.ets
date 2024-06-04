import audio from '@ohos.multimedia.audio';
import { DynamicRequest } from '../api/DynamicRequest';
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import {dynamicDetailCommentData} from '../viewmodel/TestViewModel'




@Preview
@Component
export struct DynamicDetailCommentCart {

  dynamicId: string = '148';

  @State DynamicDetailComponentData: DynamicDetailComment = dynamicDetailCommentData;
  @State isReply: boolean = false;

  @State replys: DynamicDetailComment[] = [];

  @State replysTotal: number = 0;

  pageIndex: number = 1;


  getLikeCount(likeCount:Number){
    return likeCount as unknown as string
  }

  aboutToAppear() {
    console.info('pageIndex in DynamicDetailCommentCart ',this.pageIndex)
    let dynamicCommentsDto:any = {
      "pageIndex": this.pageIndex,
      "pageSize": 3,
      "dynamicId": this.dynamicId,
      "topCommentId": this.DynamicDetailComponentData.commentId,
      "type": 2
    }

    DynamicRequest.getDynamicDetailComments(dynamicCommentsDto).then((res) => {
      this.DynamicDetailComponentData.dynamicDetailCommentPageVo = res
      this.replys = res.records
      this.replysTotal = res.total
      this.isReply = true
      console.info('aboutToAppear in DynamicDetailCommentCart ',JSON.stringify(res))
    })
  }

  getMoreComment(){
    this.pageIndex += 1
    console.info('pageIndex in DynamicDetailCommentCart ',this.pageIndex)
    let dynamicCommentsDto:any = {
      "pageIndex": this.pageIndex,
      "pageSize": 3,
      "dynamicId": this.dynamicId,
      "topCommentId": this.DynamicDetailComponentData.commentId,
      "type": 2
    }
    DynamicRequest.getDynamicDetailComments(dynamicCommentsDto).then((res) => {
      this.DynamicDetailComponentData.dynamicDetailCommentPageVo.records = this.DynamicDetailComponentData.dynamicDetailCommentPageVo.records.concat(res.records)
      this.replys = this.replys.concat(res.records)
      console.info('aboutToAppear in DynamicDetailCommentCart ',JSON.stringify(res))
    })
  }

  build() {
    Row(){
      Column(){
          Image(this.DynamicDetailComponentData.avatarUrl)
            .borderRadius(50)
            .width(25)
            .height(25)
            // .border({color:'red',width:1})
      }
      .width('7%')
      // .border({color:'red',width:1})
      // .border({color: 'red', width: 1})
      Column(){
        Row(){
          Column(){
            Column(){
              Text(this.DynamicDetailComponentData.username)
                .fontColor('#3C3F41')
                .width('100%')
                .fontSize(10)
              Text(this.DynamicDetailComponentData.content)
                .fontSize(12)
                .width('100%')
                .margin({top:5})
              Text(this.DynamicDetailComponentData.commentDate)
                .fontSize(10)
                .fontColor('#45494A')
                .width('100%')
                .margin({top:5})
            }
            .width('95%')
          }
          .width('93%')
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
        if (this.isReply) {
          ForEach(this.replys, (item: DynamicDetailComment, index) => {
            DynamicDetailCommentCart({DynamicDetailComponentData: item})
          })
          if (this.replys.length < this.replysTotal) {
            Text('查看更多评论')
              .fontSize(12)
              .fontColor('#3781C8')
              .width('100%')
              .margin({top:10,left:50})
              .onClick(()=>{
                this.getMoreComment()
              })
          }
        }

      }
      // .border({color: 'red', width: 1})
      .width('93%')
    }
    .margin({top:8})
    // .border({color:'blue',width:1})
    // .width('90%')
    .alignItems(VerticalAlign.Top)
  }
}