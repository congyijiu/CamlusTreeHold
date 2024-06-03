import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'

@Entry
@Component
struct Index {
  @State minSize: number = 50
  @State maxSize: number = 100

  @State datasource: WaterFlowDataSource = new WaterFlowDataSource()

  aboutToAppear() {
    this.datasource.setDataArray(waterFlowData);
  }

  build() {
    WaterFlow() {
      LazyForEach(this.datasource, (item: DynamicItem) => {
        FlowItem() {
          DynamicCard({ dynamicItem: item })
            .onClick(() => {
              router.pushUrl(
                { url: 'pages/testPage',
                  params: {
                    id: item.id,
                    title: item.title,
                    imageUri: item.image_url,
                  }}
              );
            })

        }
      }, (item: DynamicItem) => JSON.stringify(item))
    }
    .layoutWeight(1)
    .layoutDirection(FlexDirection.Column)
    .columnsTemplate('1fr 1fr')

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