// xxx.ets

import { DynamicRequest } from '../api/DynamicRequest'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment';

@CustomDialog
@Component
@Preview
export struct CommentInputCustomDialog {
  CommentInputCustomDialog?: CustomDialogController
  @Link onReplyComment:DynamicDetailComment[];
  toComment:DynamicDetailComment;
  topCommentId:number;
  @Link teststring: string;
  @Link placeholder: string;
  @Link likeCount: number;
  dynamicId: string = '1';
  cancel: () => void

  async replyDynamic(){
    let dynamicCommentsAddDto = {
      content: this.teststring,
      dynamicId: this.dynamicId,
      topCommentId: null,
      toCommentId: null
    }
    console.log('comment content',JSON.stringify(dynamicCommentsAddDto))
    await DynamicRequest.addDynamicComment(dynamicCommentsAddDto).then((res) => {
      console.log(JSON.stringify(res))
      this.teststring = JSON.stringify(res)
      console.log('comment content',this.teststring)
    })
  }
  async replyDynamicComment(){
    if (this.topCommentId == null) {
      this.topCommentId = this.toComment.commentId
      console.log('topCommentId',this.topCommentId)
    }
    console.log('toComment',JSON.stringify(this.toComment))
    console.log('onReplyComment',JSON.stringify(this.onReplyComment))
    if (this.onReplyComment != null) {
      let dynamicCommentsAddDto = {
        content: this.teststring,
        dynamicId: this.toComment.dynamicId,
        topCommentId: this.topCommentId,
        toCommentId: this.toComment.commentId
      }
      console.log('dynamicCommentsAddDto',JSON.stringify(dynamicCommentsAddDto))
      await DynamicRequest.addDynamicComment(dynamicCommentsAddDto).then((res) => {
        console.log(JSON.stringify(res))
        this.teststring = JSON.stringify(res)
        console.log('teststring',this.teststring)
      })
    }else {
      let dynamicCommentsAddDto = {
        content: this.teststring,
        dynamicId: this.toComment.dynamicId,
        topCommentId: this.topCommentId,
        toCommentId: this.toComment.commentId
      }
      console.log('dynamicCommentsAddDto',JSON.stringify(dynamicCommentsAddDto))
      await DynamicRequest.addDynamicComment(dynamicCommentsAddDto).then((res) => {
        console.log(JSON.stringify(res))
        this.teststring = JSON.stringify(res)
        console.log('teststring',this.teststring)
      })
    }

  }

  async reply(){
    if (this.placeholder == '') {
        console.log('comment content Dynamic',this.teststring)
        await this.replyDynamic()
    }else{
         console.log('comment content DynamicComment',this.teststring)
        await this.replyDynamicComment()
    }
    if (this.likeCount) {
      this.likeCount = this.likeCount + 1
    }
  }

  build() {
    Column() {
      Row(){
        TextArea({placeholder: this.placeholder})
          .width("75%")
          .backgroundColor('#C1C1C2')
          .id('123')
          .onChange((e) => {
            this.teststring = e
          })
        Button('发送')
          .height(35)
          // .fontSize(20)
          .width(60)
          .margin({left: 10})
          .onClick(async () => {
            await this.reply()
            await this.cancel()
            this.CommentInputCustomDialog.close()
          })
      }
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFFFFF')
  }
}

// @Entry
// @Component
// struct CustomDialogUser {
//   @State textValue: string = ''
//   @State inputValue: string = 'click me'
//   dialogController: CustomDialogController = new CustomDialogController({
//     builder: CommentInputCustomDialog(),
//     autoCancel: true,
//     alignment: DialogAlignment.Bottom,
//     offset: { dx: 0, dy: -20 },
//     gridCount: 4,
//     customStyle: true
//   })
//
//   // 在自定义组件即将析构销毁时将dialogControlle置空
//   aboutToDisappear() {
//     this.dialogController = null // 将dialogController置空
//   }
//
//   onCancel() {
//     console.info('Callback when the first button is clicked')
//   }
//
//   onAccept() {
//     console.info('Callback when the second button is clicked')
//   }
//
//   exitApp() {
//     console.info('Click the callback in the blank area')
//   }
//
//   build() {
//     Column() {
//       Button(this.inputValue)
//         .onClick(() => {
//           this.dialogController.open()
//
//         }).backgroundColor(0x317aff)
//     }.width('100%').margin({ top: 5 })
//   }
// }