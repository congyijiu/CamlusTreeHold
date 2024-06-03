import {DynamicDetailCart} from '../components/DynamicDetailCart'
import DynamicDetailComment from '../viewmodel/DynamicDetailComment'
import {dynamicDetailCommentData} from '../viewmodel/TestViewModel'




@Preview
@Component
struct DynamicDetailComponentCart {

  @State DynamicDetailComponentData: DynamicDetailComment = dynamicDetailCommentData;

  build() {
    Row(){
      Column(){

      }
      .width(100)
      .border({color: 'red', width: 1})
      Column(){

      }
      .width(200)
      Column(){

      }
    }
  }
}