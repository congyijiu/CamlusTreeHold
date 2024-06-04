import {NavigationToolBar}  from '../components/NavigationToolBar'
import router from '@ohos.router'
import {photopicker}from'../components/photoPicker'
@Entry
@Component
struct PublishPage {
  currentIndex: number = 1

  build() {
    Column() {
      Row() {
        Column() {
          photopicker()
          NavigationToolBar({ currentIndex: this.currentIndex })
        }
        .alignItems(HorizontalAlign.Start)

      }
    }
  }
}
