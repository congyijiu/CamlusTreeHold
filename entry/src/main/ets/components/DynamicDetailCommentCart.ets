import audio from '@ohos.multimedia.audio';
import router from '@ohos.router';
import { DynamicRequest } from '../api/DynamicRequest';
import { like1image, likeimage } from '../common/common';
import { PreferencesUtil } from '../common/PreferencesUtil';
import {DynamicDetailCart} from '../components/DynamicDetailCart'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import {dynamicDetailCommentData} from '../viewmodel/TestViewModel'
import { CommentInputCustomDialog } from './CommentInputCustomDialog';


@Preview
@Component
export struct DynamicDetailCommentCart {

  dynamicId: string = '1';

  @State DynamicDetailComponentData: DynamicDetailComment = dynamicDetailCommentData;
  @State isReply: boolean = false;
  @Link teststring: string;

  @Link onReplyComment:DynamicDetailComment[];
  @Link likeCount: number;

  @State replys: DynamicDetailComment[] = [];
  @State replysuser: string = '';
  @State replysTotal: number = 0;
  
  
  @State commentcontent: string = '';

  @State theCartColor: string = '#ffffff';


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

  cartreply(){
    this.replysuser = '回复:' +this.DynamicDetailComponentData.username
    this.dialogController.open()
    this.reply('123',this.dynamicId)
  }

  pageIndex: number = 1;

  reply(id:string,params:string){
    this.teststring = 'testbwb'
    sendEventByKey(id,10,params)
  }


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

    if (this.DynamicDetailComponentData.replyUsername != null) {
      if (this.DynamicDetailComponentData.topCommentId != null && this.DynamicDetailComponentData.toCommentId != null && this.DynamicDetailComponentData.topCommentId != this.DynamicDetailComponentData.toCommentId) {
        this.commentcontent = '回复:' + this.DynamicDetailComponentData.replyUsername + ' ' + this.DynamicDetailComponentData.content
      }else {
        this.commentcontent = this.DynamicDetailComponentData.content
      }
    }
    else{
      this.commentcontent = this.DynamicDetailComponentData.content
    }

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

  exitreply(){
    console.info('取消评论');
    this.teststring = ''

  }

  async onSendReply(){
    console.info('点击了发送按钮');
    let comment = JSON.parse(this.teststring);
    console.info('comment in commentcart',JSON.stringify(comment))
    let username = await PreferencesUtil.getPreferenceValue('MyPreferences','username','') as unknown as string
    let avatarUrl = await PreferencesUtil.getPreferenceValue('MyPreferences','avatarUrl','') as unknown as string
    let commenttemp = {
      "commentId": comment.commentId,
      "dynamicId": comment.dynamicId,
      "userId": comment.userId,
      "topCommentId": comment.topCommentId,
      "toCommentId": comment.toCommentId,
      "content": comment.content,
      "commentDate": new Date(),
      "replyCount": 0,
      "likeCount": 0,
      "replyUserId": null,
      "replyUsername": comment.replyUsername,
      "isDeleted": 0,
      "username": username,
      "avatarUrl": avatarUrl,
      "isLike": null,
      dynamicDetailCommentPageVo: null
    }

    console.info('commenttemp in commentcart',JSON.stringify(commenttemp))
    if (this.onReplyComment != null) {
      let test1 = []
      test1 = await test1.concat(commenttemp,this.onReplyComment)
      this.onReplyComment = test1
      console.info('this.onReplyComment tocomment',JSON.stringify(this.onReplyComment))
    }else {
      let test1 = []
      test1 = await test1.concat(commenttemp,this.replys)
      this.replys = test1
      console.info('test1 topcomment',JSON.stringify(test1))
      console.info('this.replys topcomment',JSON.stringify(this.replys))
    }
  }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CommentInputCustomDialog({
      cancel: ()=>{this.onSendReply()},
      teststring: $teststring,
      dynamicId:this.dynamicId,
      placeholder:$replysuser,
      onReplyComment:$onReplyComment,
      toComment:this.DynamicDetailComponentData,
      topCommentId:this.DynamicDetailComponentData.topCommentId,
      likeCount:$likeCount
    }),
    cancel: this.exitreply,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: 0 },
    gridCount: 4,
    customStyle: true
  })

  build() {
    Row(){
      Column(){
          Image(this.DynamicDetailComponentData.avatarUrl)
            .borderRadius(50)
            .width(25)
            .height(25)
            .border({color:'#f0f0f0',width:1})
            .onClick(()=>{
              console.info('点击了评论头像');
              router.pushUrl(
                { url: 'pages/OtherUserPage',
                  params: {
                    otherUserId: this.DynamicDetailComponentData.userId,
                  }}
              );
            })
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
              Text(this.commentcontent)
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
          .onClick(()=>{
            console.info('点击了回复按钮',this.teststring);
            this.commentAnimal()
            this.cartreply()
          })
          .width('93%')
          .backgroundColor(this.theCartColor)
          // .border({color: 'red', width: 1})
          Column(){
            if (this.DynamicDetailComponentData.isLike == 1) {
              Image(like1image)
                .width(16)
                .margin({ top: 5 })
                .onClick(() => {
                  console.info('点击了取消点赞按钮');
                  this.DynamicDetailComponentData.isLike = 0
                  this.DynamicDetailComponentData.likeCount -= 1
                  let dynamicCommentsActionDto = {
                    "commentId": this.DynamicDetailComponentData.commentId,
                    "isLike": 0
                  }
                  DynamicRequest.dynamicCommentsLike(dynamicCommentsActionDto).then((res) => {
                    console.info('取消点赞成功',JSON.stringify(res))
                  })
                })
            }
            else {
              Image(likeimage)
                .width(16)
                .margin({ top: 5 })
                .onClick(() => {
                  console.info('点击了点赞按钮');
                  this.DynamicDetailComponentData.isLike = 1
                  this.DynamicDetailComponentData.likeCount += 1
                  let dynamicCommentsActionDto = {
                    "commentId": this.DynamicDetailComponentData.commentId,
                    "isLike": 1
                  }
                  DynamicRequest.dynamicCommentsLike(dynamicCommentsActionDto).then((res) => {
                    console.info('取消点赞成功',JSON.stringify(res))
                  })
                })
            }
            Text(this.DynamicDetailComponentData.likeCount.toString())
              .fontSize(10)
          }
          .width('7%')
          // .border({color: 'red', width: 1})
        }
        // .backgroundColor('#A6A6A7')

        .alignItems(VerticalAlign.Top)
        if (this.isReply) {
          ForEach(this.replys, (item: DynamicDetailComment, index) => {
            DynamicDetailCommentCart({DynamicDetailComponentData: item,dynamicId:this.dynamicId,teststring:$teststring,onReplyComment:$replys,likeCount:$likeCount})
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