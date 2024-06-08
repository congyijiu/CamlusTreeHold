
import router from '@ohos.router';
import DynamicWaterFlower from '../viewmodel/DynamicItem'
import { DynamicWaterFlow } from '../components/DynamicWaterFlow'
import { PreferencesUtil } from '../common/PreferencesUtil'
import { UserRequest } from '../api/UserRequest';
import { formToJSON } from '@ohos/axios';
import DynamicType from '../viewmodel/DynamicType'
import { DynamicRequest } from '../api/DynamicRequest';
import { WaterFlowTabs } from './WaterFlowTabs';
import DynamicPage from '../viewmodel/DynamicPage'
import DynamicItem from '../viewmodel/DynamicItem'
import DynamicDetail from '../viewmodel/DynamicDetail';
import { WaterFlowDataSource } from '../viewmodel/WaterFlowDataSource';
import { UserWaterFlowTabs } from './UserWaterFlowTabs';
import { OtherUserWaterFlowTabs } from './OtherUserWaterFlowTabs';


@Preview
@Component
export struct OtherUserCard{
  @State private userImg : string = 'https://ts1.cn.mm.bing.net/th/id/R-C.57384e4c2dd256a755578f00845e60af?rik=uy9%2bvT4%2b7Rur%2fA&riu=http%3a%2f%2fimg06file.tooopen.com%2fimages%2f20171224%2ftooopen_sy_231021357463.jpg&ehk=whpCWn%2byPBvtGi1%2boY1sEBq%2frEUaP6w2N5bnBQsLWdo%3d&risl=&pid=ImgRaw&r=0'
  @State private userName: string ='林甲锋'
  @State private signature: string ='我爱免无围现约，我林甲锋是个大使逼1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'
  @State private follow: number = 1
  @State private fans: number = 1
  @State private bgcImg: string = 'https://img.zcool.cn/community/01b2945b0663dda801218cf4617993.jpg@3000w_1l_0o_100sh.jpg'
  @State private testToken : string = '12'
  @State private userID : number = 2
  @State private testId : number = 0
  @State dynamicTypeList:DynamicType[] = [{"id":'1',"typeName":"用户作品","description":"默认","isDefault":'1',"status":'1',"sortOrder":0,"creationDate":"2023-11-22 17:08:10"},{"id":'2',"typeName":"用户收藏","description":"校园","isDefault":'0',"status":'1',"sortOrder":0,"creationDate":"2023-11-28 10:24:44"}]
  @State likeDatasource: WaterFlowDataSource = new WaterFlowDataSource()
  @State publicDatasource: WaterFlowDataSource = new WaterFlowDataSource()
  @State token : string = ''
  @State otherUserId : number = 1

  dynamicDto:any = {
    "pageIndex": 1,
    "pageSize": 10,
    "userId": 1
  }


  aboutToAppear() {


      //res转为Json

      // PreferencesUtil.putPreferenceValue('MyPreferences', 'id' , res.id)
      this.userID = PreferencesUtil.userId
      console.log('---lingjia' + JSON.stringify(this.userID))
      this.otherUserId = router.getParams()['otherUserId']

      UserRequest.getUserInfo(this.otherUserId).then((res) => {
        this.userImg = res.avatarUrl
        this.userName = res.username
        this.signature = res.hobbies
        this.follow = res.follows
        this.fans = res.fans
        this.dynamicDto['userId'] = this.otherUserId
        console.log('---lingjiaUserRequest' + JSON.stringify(res.avatarUrl))
        DynamicRequest.getUserFavoriteDynamicItemById(this.dynamicDto).then((res) => {
          let dynamicIiems:DynamicItem[] = []
          dynamicIiems = res
          this.likeDatasource.setDataArray(dynamicIiems);
          console.log('getUserFavoriteDynamicItemById' + JSON.stringify(dynamicIiems))
          console.log('getUserFavoriteDynamicItemById+++' + JSON.stringify(this.likeDatasource))
        })


        DynamicRequest.getDynamicItem(this.dynamicDto,this.token).then((value) => {
          let dynamicIiems:DynamicItem[] = []
          dynamicIiems = value
          console.log(JSON.stringify(value));
          this.publicDatasource.setDataArray(dynamicIiems);
        })
      })
  }

  build(){
    Column({space:0}){
      //上半部分
      Column(){
        //返回按钮
        Row(){
          // Image($r('app.media.ic_camera_master_ai_leaf'))
          Image($r('app.media.return')).width(26).height(26)
            .onClick((res)=>{
              router.back();
            })

        }
        .width('100%')
        .padding(6)
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Top)

        Row(){
          //图片
          Image(this.userImg).width(100).height(100).borderRadius(100).backgroundColor('#2B2B2B')

          //姓名和签名
          Column(){
            Column(){
              Text(this.userName).fontSize(15).width('54%').fontWeight(700).fontColor('#31D6CD')
              Text(this.signature).fontSize(10).width('54%')
            }


            //关注与粉丝
            Row(){
              Text(this.follow + '关注').fontSize(15)
              Text(this.fans + '粉丝').fontSize(15)
              Button({type:ButtonType.Capsule}){
                Text('发送消息').fontColor('#F3F4F6').fontSize(10)
              }.width(60).height(24).onClick(()=>{
                console.log('关注')
                UserRequest.getUserInfo(this.otherUserId).then((res) => {
                  router.pushUrl({
                    url:'pages/SendMessagePage',
                    params:{
                      userId:this.otherUserId,
                      username:res.username,
                      avatarUrl:res.avatarUrl
                    }
                  })
                })

              })

            }.width('54%').justifyContent(FlexAlign.SpaceBetween)

          }.height(130).justifyContent(FlexAlign.SpaceAround)

        }.width('100%').justifyContent(FlexAlign.SpaceEvenly)

      }
      .justifyContent(FlexAlign.SpaceEvenly)
      .width('100%')
      .height(200)
      // .border({width:1 , color:'black'})
      .backgroundImage(this.bgcImg)



      //下半部分 用户作品与收藏
      Column(){
        OtherUserWaterFlowTabs({dynamicTypeList:$dynamicTypeList})
          .width('100%')
          .height(50)
      }.width('100%')

    }
    .width('100%')
    .height('97%')
    // .border({width:1 , color:'red'})
    .alignItems(HorizontalAlign.Start)
    .margin({top:-15})
  }
}