import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData,dynamicDetailCommentPageData} from '../viewmodel/TestViewModel'
import {DynamicDetailTop} from '../components/DynamicDetailTop'
import DynamicDetailCommentPageVo from '../viewmodel/DynamicDetailCommentPageVo'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import  {DynamicDetailCommentsPage} from '../components/DynamicDetailCommentsPage'
import router from '@ohos.router'



@Entry
@Component
struct DynamicDetailPage {

  @State dynamicId: string = '1';

  @State dynamicDtail: DynamicDetail = dynamicDetailData;
  @State dynamicDetailCommentPageVo: DynamicDetailCommentPageVo = dynamicDetailCommentPageData;

  onPageShow() {
    this.dynamicId = router.getParams()['id'];
    console.info('dynamicId:', this.dynamicId);
  }

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
            DynamicDetailCommentsPage()
          }
        }
        .edgeEffect(EdgeEffect.Spring)
      }
      .width('100%')
    }
    // .height('100%')
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}