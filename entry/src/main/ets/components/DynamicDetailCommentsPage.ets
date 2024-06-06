import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData,dynamicDetailCommentPageData} from '../viewmodel/TestViewModel'
import {DynamicDetailTop} from '../components/DynamicDetailTop'
import DynamicDetailCommentPageVo from '../viewmodel/DynamicDetailCommentPageVo'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import {DynamicRequest} from '../api/DynamicRequest'
import { expect } from '@ohos/hypium'
import router from '@ohos.router'




@Preview
@Component
export struct DynamicDetailCommentsPage {

  @State dynamicId: string = '148';

  @Link teststring: string;

  @State dynamicDetailCommentPageVo: DynamicDetailCommentPageVo = dynamicDetailCommentPageData;
  clear:()=> void = () => {
    this.dynamicDetailCommentPageVo = dynamicDetailCommentPageData;
  }
  aboutToAppear(){
    this.dynamicId = router.getParams()['id'];

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

  build() {
    Column(){
      Text('共23条评论')
        .fontColor('#333333')
        .fontSize(12)
        .width('100%')
      ForEach(this.dynamicDetailCommentPageVo.records, (item: DynamicDetailComment, index) => {
        DynamicDetailCommentCart({DynamicDetailComponentData: item,dynamicId: this.dynamicId,teststring:$teststring})
      })
    }
    .width('90%')
  }
}