import router from '@ohos.router'
import { testcomponent } from '../components/testcomponent'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Button('Click me')
        .onClick(this.test)
        .margin(20)
      Button('Click me')
        .onClick(this.test)
        .margin(20)
      Button('Click me')
        .onClick(this.test)
        .margin(20)
      Button('Click me')
        .onClick(this.test)
        .margin(20)
      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        testcomponent({  imageId:'1',titleId: '111' })
          .onClick(() => {
            // 点击小图时路由跳转至下一页面
            router.pushUrl(
              {
                url: 'pages/testPage',
                params: {
                  titleId: '111',
                  imageId: '1'
                }
              }
            );
          })
          .border({ width: 1, color: '#000000' })

        testcomponent({ imageId: '2', titleId: '222' })
          .onClick(() => {
            // 点击小图时路由跳转至下一页面
            router.pushUrl({
              url: 'pages/testPage',
              params: {
                titleId: '222',
                imageId: '2'
              }
            });
          })
          .border({ width: 1, color: '#000000' })
      }
    }
    .width('100%')
    .border({ width: 1, color: '#000000' })

  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }

  test() {
    router.pushUrl(
      { url: 'pages/testPage' },
      router.RouterMode.Single,
      err => {
        console.log('pushUrl err', err)
      }
    );
    console.log('mounted')
  }
}