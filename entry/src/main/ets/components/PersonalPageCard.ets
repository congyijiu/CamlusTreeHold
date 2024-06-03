
import router from '@ohos.router';

@Preview
@Component
export struct PersonPageCard{
  @State private userName: string ='林甲锋'
  @State private signature: string ='我爱免无围现约，我林甲锋是个大使逼1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111'
  @State private follow: number = 1
  @State private fans: number = 1

  build(){
    Column(){

      //退出按钮
      Row(){
        Image('').width(24).height(24).backgroundColor('red')
      }.padding(5).width('100%').justifyContent(FlexAlign.End)


      //top部分
     Row(){
       //图片
      Image('').width(100).height(100).borderRadius(100).backgroundColor('#2B2B2B')

       //姓名和签名
       Column(){
         Column(){
           Text(this.userName).fontSize(15).width('54%').fontWeight(700).fontColor('#31D6CD')
           Text(this.signature).fontSize(10).width('54%')
         }

         // Blank().width('54%')
         //   .height('10')
         //   .border({width:1 , color:'red'})
         // Blank().height(20).border({width:1 , color:'blue'})

         //关注与粉丝
         Row(){
           Text(this.follow + '关注').fontSize(15)
           Text(this.fans + '粉丝').fontSize(15)
           Button({type:ButtonType.Capsule}){
             Text('编辑资料').fontColor('#F3F4F6').fontSize(10)
           }.width(60).height(24)

         }.border({width:1 , color:'blue'}).width('54%').justifyContent(FlexAlign.SpaceBetween)

       }.height(130).border({width:1 , color:'blue'}).justifyContent(FlexAlign.SpaceAround)


     }
     .justifyContent(FlexAlign.SpaceEvenly)
     // .padding(20)
     .width('100%')
      .height(200)
      .border({width:1 , color:'blue'})
      // .backgroundImage('app.media.logo')
      // .backgroundColor('#2B2B2B')



    }
    .width('100%')
    .height('100%')
    .border({width:1 , color:'red'})
  }
}