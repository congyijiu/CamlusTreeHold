
import router from '@ohos.router';
import { UserRequest } from '../api/UserRequest';
import promptAction from '@ohos.promptAction';

@Preview
@Component
export struct registerCard{

  @State username: string = '';
  @State password: string = ''
  @State passwordAgain: string = '';

  build(){
    Column({space: 15}){
      //图片
      Row(){
        Image($r('app.media.img_ico')).width('70%').height(150).borderRadius(20)
      }

      //文字信息
      Row(){
        Text('Welcome Back')
          .fontSize(25)
          .fontWeight(500)
          .fontColor('white')
      }

      //登录注册文字
      Row(){
        Text('登录').fontSize(20)
          .fontColor('white')
          .onClick(()=>{
            //处理点击事件
            router.pushUrl(
              { url: 'pages/Login',
                params: {
                }}
            );
          })
        // .border({ width: 2 })


        Text('注册').fontSize(20)
          .fontColor('white')
          .onClick(()=>{
            //处理点击事件

            router.pushUrl(
              { url: 'pages/Register',
                params: {
                }}
            );
          })
          .decoration({
          type: TextDecorationType.Underline,
          color: Color.White
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
            .onChange((value:string)=>{
              this.username = value
              console.log(this.username)
            })

          TextInput({placeholder:'请输入密码'}).width('90%').backgroundColor('#F2F2F2').textAlign(TextAlign.Center).height(44).onChange((value:string)=>{
            this.password = value
            console.log(this.password)
          })
          TextInput({placeholder:'请再次输入密码'}).width('90%').backgroundColor('#F2F2F2').textAlign(TextAlign.Center).height(44).onChange((value:string)=>{
            this.passwordAgain = value
            console.log(this.passwordAgain)
          })
          Button('注册').width('90%').backgroundColor('#02A7F0').height(44)
            .onClick(()=>{
              //处理点击事件
              if (this.password != this.passwordAgain) {
                promptAction.showToast({
                  message: '两次密码不一致',
                  duration: 2000,
                  bottom: 50
                });
                return
              }

              UserRequest.register(this.username,this.password,this.passwordAgain)
              console.log('1')
              router.pushUrl(
                { url: 'pages/Login',
                  params: {
                  }}
              );
            })
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
    .backgroundImage($r('app.media.bgcImag'))
    .backgroundImageSize({width: '100%', height: '100%'})
  }

}
