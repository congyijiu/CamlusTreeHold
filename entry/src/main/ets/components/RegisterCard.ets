
import router from '@ohos.router';
@Preview
@Component
export struct registerCard{

  build(){
    Column({space: 15}){
      //图片
      Row(){
        Image($r('app.media.logo')).width('86%').height(150).borderRadius(20)
      }

      //文字信息
      Row(){
        Text('Welcome Back')
          .fontSize(25)
          .fontWeight(500)

      }

      //登录注册文字
      Row(){
        Text('登录').fontSize(20)

        // .border({ width: 2 })


        Text('注册').fontSize(20)
          .decoration({
          type: TextDecorationType.Underline,
          color: Color.Blue
        })
      }
      .width("100%")
      // .border({width:1,color:'#333840'})
      .justifyContent(FlexAlign.SpaceEvenly)

      //组合
      Row(){
        Column(){
          TextInput({placeholder:'请输入账号'})
            .width('90%')
            .backgroundColor('#F2F2F2')
            .textAlign(TextAlign.Center)
            .height(44)

          TextInput({placeholder:'请输入密码'}).width('90%').backgroundColor('#F2F2F2').textAlign(TextAlign.Center).height(44)
          TextInput({placeholder:'请再次输入密码'}).width('90%').backgroundColor('#F2F2F2').textAlign(TextAlign.Center).height(44)
          Button('登录').width('90%').backgroundColor('#02A7F0').height(44)
        }
        .height(300)
        // .border({width:1,color:'#333840'})
        .justifyContent(FlexAlign.SpaceAround)
      }.height(340)

      .width(250)
      .justifyContent(FlexAlign.Center)
      .border({width:1,color:'#02A7F0'})
      .borderRadius(30)
    }.width('100%')
    .height('100%')
    .borderWidth(1)
    .padding(80)
  }

}
