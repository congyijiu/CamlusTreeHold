import router from '@ohos.router'
import {loginCard} from '../components/LoginCard'
import {registerCard} from '../components/RegisterCard'
import { PersonPageCard} from '../components/PersonalPageCard'
import {OtherUserCard } from '../components/OtherUserCard'

@Entry
@Component
struct OtherPage{

  build(){
    Column(){
      OtherUserCard()
    }
  }
}
