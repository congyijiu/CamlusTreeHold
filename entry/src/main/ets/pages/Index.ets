import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  @State DynamicCardData: Array<{ imageId: string, titleId: string }> = [
    { imageId: 'imageId1', titleId: 'titleId1' },
    { imageId: 'imageId2', titleId: 'titleId2' },
    { imageId: 'imageId3', titleId: 'titleId3' },
    { imageId: 'imageId4', titleId: 'titleId4' },
    { imageId: 'imageId5', titleId: 'titleId5' },
    { imageId: 'imageId6', titleId: 'titleId6' },
    { imageId: 'imageId7', titleId: 'titleId7' },
    { imageId: 'imageId8', titleId: 'titleId8' },
    { imageId: 'imageId9', titleId: 'titleId9' },
    { imageId: 'imageId10', titleId: 'titleId10'}
  ]

  build() {
    Column() {
      Blank()
        .height(100)
        .width('100%')
        .backgroundColor('#FFFFFF')
      Flex({ justifyContent: FlexAlign.SpaceAround }) {

        WaterFlow(){
          ForEach(this.DynamicCardData, (item, index) => {
            FlowItem() {
              DynamicCard({ imageId: item.imageId, titleId: item.titleId })
                .onClick(() => {
                  // 点击小图时路由跳转至下一页面
                  router.pushUrl(
                    {
                      url: 'pages/testPage',
                      params: {
                        titleId: item.titleId,
                        imageId: item.imageId
                      }
                    }
                  );
                })
            }
          })
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