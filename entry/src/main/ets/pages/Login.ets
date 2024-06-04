import router from '@ohos.router'
import {loginCard} from '../components/LoginCard'
import {registerCard} from '../components/RegisterCard'
@Entry
@Component
struct testPage{
  build(){
    Column(){
      loginCard()
    }
  }
}
