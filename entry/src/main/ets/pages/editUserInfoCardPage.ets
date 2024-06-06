import router from '@ohos.router'
import {loginCard} from '../components/LoginCard'
import {registerCard} from '../components/RegisterCard'
import {editUserInfoCard} from '../components/editUserInfoCard'
import {editTabCard} from '../components/editTabCard'
@Entry
@Component
struct testPage{
  build(){
    Column(){
      editUserInfoCard()
    }
  }
}
