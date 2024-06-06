
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
  @State private userID : number = 0
  @State private testId : number = 0

  async aboutToAppear() {
    this.testToken = await PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
    console.log('---ling' + this.testToken)
    await UserRequest.getUserInfoByToken(this.testToken).then(async (res) => {
      //res转为Json

      PreferencesUtil.putPreferenceValue('MyPreferences', 'id' , res.id)
      this.userID = await PreferencesUtil.getPreferenceValue('MyPreferences','id','') as unknown as number
      console.log('---lingjia' + JSON.stringify(this.userID))

      // console.log('---lingjia' + JSON.stringify(res.data.id))
    })

    await UserRequest.getUserInfo(this.userID).then((res) => {
      this.userImg = res.avatarUrl
      this.userName = res.username
      this.signature = res.hobbies
      this.follow = res.follows
      this.fans = res.fans
      console.log('---lingjiaUserRequest' + JSON.stringify(res.avatarUrl))
    })


  }



  build(){
    Column({space:0}){

      //上半部分
      Column(){

       //退出按钮
       Row(){
         // Image($r('app.media.ic_camera_master_ai_leaf'))
         Image($r('app.media.quit')).width(26).height(26)
           .onClick(async (res)=>{
             //处理点击事件

             // PreferencesUtil.putPreferenceValue('MyPreferences', 'id' , res.id)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'avatarUrl' , res.avatarUrl)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'hobbies' , res.hobbies)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'gender' , res.gender)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'signature' , res.signature)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'phoneNumber' , res.phoneNumber)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'registrationDate' , res.registrationDate)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'email' , res.email)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'username' , res.username)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'follows' , res.follows)
             // PreferencesUtil.putPreferenceValue('MyPreferences', 'fans' , res.fans)

             //1.token清''
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'token' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'id' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'avatarUrl' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'hobbies' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'gender' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'signature' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'phoneNumber' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'registrationDate' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'username' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'follows' , '')
             await PreferencesUtil.putPreferenceValue('MyPreferences', 'fans' , '')



             //测试一下token清零
             this.testToken =  PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
             this.testId = PreferencesUtil.getPreferenceValue('MyPreferences','id','') as unknown as number


             // await console.log('---ppp---' + this.testToken)
             // await console.log('---ppp---testId' + this.testId)
             // console.log('---ppp---' +   JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','id','')))
             await console.log('---ppp---avatarUrl' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','avatarUrl','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','hobbies','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','gender','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','signature','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','phoneNumber','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','registrationDate','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','email','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','username','')))
             // console.log('---ppp---' + PreferencesUtil.getPreferenceValue('MyPreferences','username',''))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','follows','')))
             await console.log('---ppp---' + JSON.stringify(PreferencesUtil.getPreferenceValue('MyPreferences','fans','')))


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
                    userID: this.userID

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

      }.width('100%')




    }
    .width('100%')
    .height('97%')
    .border({width:1 , color:'red'})
    .alignItems(HorizontalAlign.Start)
    .margin({top:-15})
  }
}