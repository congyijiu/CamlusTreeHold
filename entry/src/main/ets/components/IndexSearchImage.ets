
import router from '@ohos.router';
import { searchimage } from '../common/common';
@Preview
@Component
export struct IndexSearchImage {
  build(){
    Column(){
      Image(searchimage)
        .width(22)
        .onClick(() => {
          console.log('searchimage click')
          router.pushUrl(
            { url: 'pages/SearchInitPage' },
            router.RouterMode.Single,
            err => {
              console.log('pushUrl err', err)
            }
          );
        })
    }
  }
}