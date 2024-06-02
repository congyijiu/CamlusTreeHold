import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Blank()
        .height(100)
        .width('100%')
        .backgroundColor('#FFFFFF')
      Flex({ justifyContent: FlexAlign.SpaceAround }) {

        WaterFlow(){
          FlowItem(){
            DynamicCard({ imageId: 'imageId1', titleId: '1' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '1',
                      imageId: 'imageId1'
                    }
                  }
                );
              })
          }
          FlowItem(){
            DynamicCard({ imageId: 'imageId2', titleId: '2' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '2',
                      imageId: 'imageId2'
                    }
                  }
                );
              })
          }
          FlowItem(){
            DynamicCard({ imageId: 'imageId3', titleId: '3' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '3',
                      imageId: 'imageId3'
                    }
                  }
                );
              })
          }
          FlowItem(){
            DynamicCard({ imageId: 'imageId4', titleId: '4' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '4',
                      imageId: 'imageId4'
                    }
                  }
                );
              })
          }
          FlowItem(){
            DynamicCard({ imageId: 'imageId4', titleId: '4' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '4',
                      imageId: 'imageId4'
                    }
                  }
                );
              })
          }
          FlowItem(){
            DynamicCard({ imageId: 'imageId5', titleId: '5' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '5',
                      imageId: 'imageId5'
                    }
                  }
                );
              })
          }
          FlowItem(){
            DynamicCard({ imageId: 'imageId6', titleId: '6' })
              .onClick(() => {
                // 点击小图时路由跳转至下一页面
                router.pushUrl(
                  {
                    url: 'pages/testPage',
                    params: {
                      titleId: '6',
                      imageId: 'imageId6'
                    }
                  }
                );
              })
          }
        }
        .columnsTemplate('1fr 1fr')
      }

    }

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