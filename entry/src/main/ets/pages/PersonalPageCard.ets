import router from '@ohos.router'
import {loginCard} from '../components/LoginCard'
import {registerCard} from '../components/RegisterCard'
import { PersonPageCard} from '../components/PersonalPageCard'
@Entry
@Component
struct testPage{
  build(){
    Column(){
      PersonPageCard()
    }
  }
}
