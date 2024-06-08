
import router from '@ohos.router';
import { UserRequest } from '../api/UserRequest';
import promptAction from '@ohos.promptAction';
@Preview
@Component
export struct loginCard{
  // @State private imageUri: string =''
  @State handlePopup: boolean = false
  @State username: string = '';
  @State password: string = ''
  @State token : string = ''
  // @State dynamicDtail: DynamicDetail = dynamicDetailData;

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
          .decoration({
            type: TextDecorationType.Underline,
            color: Color.White,
          }) .fontColor('white')
          .onClick(()=>{
            //处理点击事件
            router.pushUrl(
              { url: 'pages/Login',
                params: {
                }}
            );
          })

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

      }
      .width("100%")
      // .border({width:1,color:'#333840'})
      .justifyContent(FlexAlign.SpaceEvenly)

      //组合
      Row(){
        Column(){
          //账号
          TextInput({placeholder:'请输入账号'})
            .width('90%')
            .backgroundColor('#F2F2F2')
            .textAlign(TextAlign.Center)
            .height(44)
            .onChange((value:string)=>{
              this.username = value
              // console.log(this.username)
            })

          //密码
          TextInput({placeholder:'请输入密码'}).width('90%').backgroundColor('#F2F2F2').textAlign(TextAlign.Center).height(44).onChange((value:string)=>{
            this.password = value
            // console.log(this.password)
          }).type(InputType.Password)
          //登录按钮
          Button('登录').width('90%').backgroundColor('#02A7F0').height(44)
            .onClick(()=>{
              //处理点击事件

              if (this.username == '' || this.password == ''){
                console.log('username or password is empty')
                promptAction.showToast({
                  message: '请输入用户名和密码',
                  duration: 2000,
                  bottom: 50
                });

                return
              }
              console.log('login button clicked')
              UserRequest.postUserInfo(this.username , this.password).then((data)=>{
                this.token = data.data.token
                console.log("---" + this.token)
              })
              // console.log('1')
              // router.pushUrl(
              //   { url: 'pages/Index',
              //     params: {
              //
              //     }}
              // );

            }).bindPopup(this.handlePopup, {
            message: 'This is a popup with PopupOptions',
          })


        }
        .height(200)
        // .border({width:1,color:'#333840'})
        .justifyContent(FlexAlign.SpaceBetween)
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
