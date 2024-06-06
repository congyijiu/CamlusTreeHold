import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData,dynamicDetailCommentPageData, dynamicDetailCommentData} from '../viewmodel/TestViewModel'
import {DynamicDetailTop} from '../components/DynamicDetailTop'
import DynamicDetailCommentPageVo from '../viewmodel/DynamicDetailCommentPageVo'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import  {DynamicDetailCommentsPage} from '../components/DynamicDetailCommentsPage'
import router from '@ohos.router'
import { DynamicDetailReplyButtom } from '../components/DynamicDetailReplyButtom'
import { CommentInputCustomDialog } from '../components/CommentInputCustomDialog'
import { Driver, ON } from '@ohos.UiTest'
import { DynamicDetailCommentInput } from '../components/DynamicDetailCommentInput'
import { DynamicRequest } from '../api/DynamicRequest'
import { baseUrl , testtoken , likeimage, favoriteimage, like1image, favorite1image} from '../common/common'
import { PreferencesUtil } from '../common/PreferencesUtil'




@Entry
@Component
struct DynamicDetailPage {

  @State dynamicId: string = '1';

  @State teststring: string = '';

  @State dynamicDtail: DynamicDetail = dynamicDetailData;
  @State dynamicDetailCommentPageVo: DynamicDetailCommentPageVo = dynamicDetailCommentPageData;

  @State replyuser: string = '';

  @State onReplyComment:DynamicDetailComment[] = null;
  @State thisComment:DynamicDetailComment = null;


  onPageShow() {
    this.dynamicId = router.getParams()['id'];
    console.info('dynamicId:', this.dynamicId);

    DynamicRequest.getDynamicDetail(this.dynamicId).then((res) => {
      this.dynamicDtail = res
    })

    let dynamicCommentsDto:any = {
      "pageIndex": 1,
      "pageSize": 10,
      "dynamicId": this.dynamicId,
      "topCommentId": 0,
      "type": 1
    }
    // console.log('aboutToAppeartest')
    DynamicRequest.getDynamicDetailComments(dynamicCommentsDto).then((res) => {
      this.dynamicDetailCommentPageVo = res
    })
  }

  reply(id:string,params:string){
    sendEventByKey(id,10,params)
  }

  exitreply(){
    console.info('取消评论');
    this.teststring = ''

  }

  async onSendReply(){
    console.info('点击了发送按钮',JSON.stringify(this.dynamicDtail));
    let comment = JSON.parse(this.teststring);
    let username = await PreferencesUtil.getPreferenceValue('MyPreferences','username','') as unknown as string
    let avatarUrl = await PreferencesUtil.getPreferenceValue('MyPreferences','avatarUrl','') as unknown as string
    let commenttemp = {
      "commentId": comment.commentId,
      "dynamicId": comment.dynamicId,
      "userId": comment.userId,
      "topCommentId": null,
      "toCommentId": null,
      "content": comment.content,
      "commentDate": new Date(),
      "replyCount": 0,
      "likeCount": 0,
      "replyUserId": null,
      "replyUsername": null,
      "isDeleted": 0,
      "username": username,
      "avatarUrl": avatarUrl,
      "isLike": null,
      dynamicDetailCommentPageVo: null
    }
    let test = this.dynamicDetailCommentPageVo
    let test2 = []

    console.info('commenttemp',JSON.stringify(commenttemp));
    test.records = test2.concat(commenttemp,test.records)
    console.info('test records',JSON.stringify(test.records));
    this.dynamicDetailCommentPageVo = test

    await console.info('点击了发送按钮',JSON.stringify(this.dynamicDetailCommentPageVo.records[0]));
  }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CommentInputCustomDialog({
      cancel: ()=>{this.onSendReply()},
      teststring: $teststring,
      dynamicId:this.dynamicId,
      placeholder: $replyuser,
      onReplyComment:$onReplyComment,
      toComment: null
    }),
    cancel: this.exitreply,
    autoCancel: true,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: 0 },
    gridCount: 4,
    customStyle: true
  })

  build() {
    Row() {
      Column() {
        DynamicDetailTop()
        Scroll(){
          Column(){
            DynamicDetailCart()
            Blank()
              .height(1)
              .border({color: '#f0f0f0', width: 1})
              .margin({top: 10, bottom: 10})
            Column(){
              Text('共23条评论')
                .fontColor('#333333')
                .fontSize(12)
                .width('100%')
              ForEach(this.dynamicDetailCommentPageVo.records, (item: DynamicDetailComment, index) => {
                DynamicDetailCommentCart({DynamicDetailComponentData: item,dynamicId: this.dynamicId,teststring:$teststring,onReplyComment:$onReplyComment})
              })
              Blank()
                .height(150)
            }
            .width('90%')
          }
        }
        .edgeEffect(EdgeEffect.Spring)
        Row(){
          Row(){
            Row(){
              Text('说点什么吧...')
                .borderRadius(20)
                .width('40%')
                .margin({left:20})
                .fontColor('#C0C0C0')

            }
            .onClick(()=>{
              console.info('点击了回复按钮',this.teststring);
              this.dialogController.open()
              this.reply('123',this.dynamicId)
            })
            .height(30)
            .borderRadius(20)
            .backgroundColor('#F5F5F5')
            Blank()
            Row(){
              if (this.dynamicDtail.isLike == 1){
                Image(like1image)
                  .width(25)
                  .onClick(()=>{
                    this.dynamicDtail.isLike = 0
                    this.dynamicDtail.likeCount = this.dynamicDtail.likeCount - 1
                    let dynamicActionDto ={
                      dynamicId: this.dynamicId,
                      islike: 1,
                      isfavorite: null
                    }
                    DynamicRequest.userDynamicActions(dynamicActionDto)
                  })
              }else{
                Image(likeimage)
                  .width(25)
                  .onClick(()=>{
                    this.dynamicDtail.isLike = 1
                    this.dynamicDtail.likeCount = this.dynamicDtail.likeCount + 1
                    let dynamicActionDto ={
                      dynamicId: this.dynamicId,
                      islike: 1,
                      isfavorite: null
                    }
                    DynamicRequest.userDynamicActions(dynamicActionDto)
                  })
              }
              Text(this.dynamicDtail.likeCount.toString())
                .fontSize(16)
            }
            .margin({right:10})
            Row(){
              if (this.dynamicDtail.isFavorite == 1) {
                Image(favorite1image)
                  .width(25)
                  .onClick(() => {
                    this.dynamicDtail.isFavorite = 0
                    this.dynamicDtail.favoriteCount = this.dynamicDtail.favoriteCount - 1
                    let dynamicActionDto ={
                      dynamicId: this.dynamicId,
                      islike: null,
                      isfavorite: 0
                    }
                    DynamicRequest.userDynamicActions(dynamicActionDto)
                  })
              }else {
                Image(favoriteimage)
                  .width(25)
                  .onClick(() => {
                    this.dynamicDtail.isFavorite = 1
                    this.dynamicDtail.favoriteCount = this.dynamicDtail.favoriteCount + 1
                    this.dynamicDtail.isFavorite = 0
                    this.dynamicDtail.favoriteCount = this.dynamicDtail.favoriteCount - 1
                    let dynamicActionDto ={
                      dynamicId: this.dynamicId,
                      islike: null,
                      isfavorite: 1
                    }
                    DynamicRequest.userDynamicActions(dynamicActionDto)
                  })
              }
              Text(this.dynamicDtail.favoriteCount.toString())
                .fontSize(16)
            }
            .margin({right:10})
          }
          .margin({top:5})
          .width('90%')
        }
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#FFFFFF')
        .width('100%')
        .margin({top:10,bottom:10})
        .height(45)
        .border({
          width: {
            top: 1,
          },
          color:'#E8E7E8',
        })
        .position({x: 0, y: '95%'})

        //   .position({x: 0, y: '93%'})
        // DynamicDetailCommentInput({teststring:$teststring})

      }
      .width('100%')
    }
    .backgroundColor('#FFFFFF')
    // .height('100%')
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0})
  }
}