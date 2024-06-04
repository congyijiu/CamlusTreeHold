import {NavigationToolBar}  from '../components/NavigationToolBar'
import router from '@ohos.router'
import {photopicker}from'../components/photoPicker'
import {PageTitle} from '../components/PageTitle'
@Entry
@Component
struct PublishPage {
  currentIndex: number = 1

  build() {
    Column() {
      Row() {
        Column() {
           PageTitle()
          photopicker()
          NavigationToolBar({ currentIndex: this.currentIndex })
        }
        .alignItems(HorizontalAlign.Start)

      }
    }

  }
  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }

}
