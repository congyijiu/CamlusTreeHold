import {DynamicDetailCart} from '../components/DynamicDetailCart'
import {DynamicDetailCommentCart} from '../components/DynamicDetailCommentCart'
import DynamicDetail from '../viewmodel/DynamicDetail'
import {dynamicDetailData} from '../viewmodel/TestViewModel'
import {DynamicDetailTop} from '../components/DynamicDetailTop'



@Entry
@Component
struct DynamicDetailPage {
  @State dynamicDtail: DynamicDetail = dynamicDetailData;

  onPageShow() {

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
            DynamicDetailCommentCart()
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