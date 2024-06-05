
import router from '@ohos.router';
import DynamicWaterFlower from '../viewmodel/DynamicItem'
import { DynamicWaterFlow } from '../components/DynamicWaterFlow'
import PreferencesUtil from '../common/PreferencesUtil'
import { UserRequest } from '../api/UserRequest';
import { formToJSON } from '@ohos/axios';
@Preview
@Component
export struct PersonPageCard{
  @State private userImg : string = 'https://ts1.cn.mm.bing.net/th/id/R-C.57384e4c2dd256a755578f00845e60af?rik=uy9%2bvT4%2b7Rur%2fA&riu=http%3a%2f%2fimg06file.tooopen.com%2fimages%2f20171224%2ftooopen_sy_231021357463.jpg&ehk=whpCWn%2byPBvtGi1%2boY1sEBq%2frEUaP6w2N5bnBQsLWdo%3d&risl=&pid=ImgRaw&r=0'
  @State private userName: string ='林甲锋'
  @State private signature: string ='我爱免无围现约，我林甲锋是个大使逼1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'
  @State private follow: number = 1
  @State private fans: number = 1
  @State private bgcImg: string = 'https://img.zcool.cn/community/01b2945b0663dda801218cf4617993.jpg@3000w_1l_0o_100sh.jpg'
  @State private testToken : string = '12'

  async aboutToAppear() {
    // this.datasource.setDataArray(waterFlowData);
    this.testToken = await PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
    console.log('---ling' + this.testToken)
    UserRequest.getUserInfoByToken(this.testToken).then((res) => {
      //res转为Json
      // let resJson = formToJSON(res)
      console.log('---ling' + JSON.stringify(res))
    })
  }



  build(){
    Column(){

      //上半部分
      Column(){

       //退出按钮
       Row(){
         // Image($r('app.media.ic_camera_master_ai_leaf'))
         Image($r('app.media.quit')).width(26).height(26)
           .onClick(()=>{
             //处理点击事件
             //1.token清''
             PreferencesUtil.putPreferenceValue('MyPreferences', 'token' , '')

             //测试一下token请0
             this.testToken =  PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
             console.log('---' + this.testToken)

             router.pushUrl(
               { url: 'pages/Login',
                 params: {
                 }}
             );
           })

       }
       .width('100%')
       .padding(6)
       .justifyContent(FlexAlign.End)
       // .backgroundColor('blue')
       // .alignItems(VerticalAlign.Top)

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
              Text('编辑资料').fontColor('#F3F4F6').fontSize(10)
            }.width(60).height(24).onClick(()=>{
              //处理点击事件
              router.pushUrl(
                { url: 'pages/editUserInfoCardPage',
                  params: {
                  }}
              );
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



      Column(){
        Row(){
          Text('作品').fontSize(20)
          Text('收藏').fontSize(20)
        }.width('100%').height(40).backgroundColor('white').justifyContent(FlexAlign.SpaceEvenly)

        DynamicWaterFlow()

      }.width('100%').height('100%')




    }
    .width('100%')
    .height('100%')
    .border({width:1 , color:'red'})
  }
}