import router from '@ohos.router'
import { DynamicCard } from '../components/DynamicCard'
import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource'
import { waterFlowData } from '../viewmodel/TestViewModel';
import DynamicItem from '../viewmodel/DynamicItem'
import {DynamicRequest} from '../api/DynamicRequest'


@Preview
@Component
export struct DynamicWaterFlow {
  @State datasource: WaterFlowDataSource = new WaterFlowDataSource()
  scroller: Scroller = new Scroller()
  @State type: number = 0

  token:string = ''

  dynamicDto:any = {
    "pageIndex": 1,
    "pageSize": 10,
    "type": 1,
    "keyWord": "",
    "userId": null
  }

  aboutToAppear() {
    let params = router.getParams()
    if (params) {
      console.log('params in DynamicWaterFlow', JSON.stringify(params))
      // let keyword = params['keyword']
      // if (keyword) {
      //   console.log('keyword in DynamicWaterFlow', keyword)
      //   this.dynamicDto['keyWord'] = keyword
      // }
      let token = params['token']
      if (token) {
        this.token = token
      }
    }
    let dynamicIiems:DynamicItem[] = []
    // this.dynamicDto['type'] = this.type
    DynamicRequest.getDynamicItem(this.dynamicDto,this.token).then((value) => {
      dynamicIiems = value
      console.log(JSON.stringify(value));
      this.datasource.setDataArray(dynamicIiems);
    })
  }

  build() {
    WaterFlow({ scroller: this.scroller }) {
      LazyForEach(this.datasource, (item: DynamicItem) => {
        FlowItem() {
          DynamicCard({ dynamicItem: item })
        }
      }, (item: DynamicItem) => JSON.stringify(item))
    }
    .onReachEnd(() => {
      console.info('onReachEnd1')
      this.dynamicDto['pageIndex'] += 1
      console.log('pageIndex',this.dynamicDto['pageIndex']);

      DynamicRequest.getDynamicItem(this.dynamicDto,this.token).then((value) => {
        let dynamicIiems:DynamicItem[]  = value
        console.log(JSON.stringify(value));
        this.datasource.addDataArray(dynamicIiems)
      })
      console.info('onReachEnd2')
    })
    .layoutWeight(1)
    .layoutDirection(FlexDirection.Column)
    .columnsTemplate('1fr 1fr')
    .backgroundColor('#F0F0F0')
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }
}