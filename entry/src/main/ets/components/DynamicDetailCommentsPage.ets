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
  @State dynamicDetailCommentPageVo: DynamicDetailCommentPageVo = dynamicDetailCommentPageData;


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
      ForEach(this.dynamicDetailCommentPageVo.records, (item: DynamicDetailComment, index) => {
        DynamicDetailCommentCart({DynamicDetailComponentData: item,dynamicId: this.dynamicId})
      })
    }
    .width('90%')
  }
}