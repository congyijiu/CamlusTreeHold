import router from '@ohos.router';
import { UserRequest } from '../api/UserRequest';

import promptAction from '@ohos.promptAction';
// import { UserRequest } from '../api/UserRequest';
import  EditUser from '../viewmodel/editUser'


@Preview
@Component
export struct editUserInfoCard{
  // @State ImageUrl: string ='';
  private select: number = 1
  gender: string[] = ['男', '女']
  @State selectedIndex: number = 0
  @State Id: number = 0
  @State name: string = ''
  @State userImage: string = 'https://ts1.cn.mm.bing.net/th/id/R-C.57384e4c2dd256a755578f00845e60af?rik=uy9%2bvT4%2b7Rur%2fA&riu=http%3a%2f%2fimg06file.tooopen.com%2fimages%2f20171224%2ftooopen_sy_231021357463.jpg&ehk=whpCWn%2byPBvtGi1%2boY1sEBq%2frEUaP6w2N5bnBQsLWdo%3d&risl=&pid=ImgRaw&r=0'
  @State hobby: string = ''
  @State phone: string = ''
  @State email: string = ''
  @State genderSelect:string = '女'
  @State genderGG:number = 0


  async aboutToAppear() {
    this.Id = router.getParams()['userID'];
    console.log('---id---:', this.Id);
    await UserRequest.getUserInfo(this.Id).then((res) => {
      this.name = res.username;

      this.userImage = res.avatarUrl;
      this.hobby = res.hobbies;
      this.genderGG = res.gender;
      // this.selectedIndex = res.gender;
      this.phone = res.phoneNumber;
      this.email = res.email;

      if (this.genderGG == 0) {
        this.genderSelect = '男'
      } else {
        this.genderSelect = '女'
      }
      console.log('---name---:', this.name);
      console.log('---userImage---:', this.userImage);
      console.log('---hobby---:', this.hobby);
      console.log('---phone---:', this.phone);
      console.log('---genderGG---:', this.genderGG);
      console.log('---email---:', this.email);

    })
  }


  build(){

    Column(){

      Column(){
        Row(){
          Text('< 返回').onClick(()=>{
            //处理点击事件
            router.pushUrl(
              { url: 'pages/PersonalPageCard',
                params: {
                }}
            );
          })
          Text('编辑资料').fontWeight(700)
          Text('保存')
            .onClick(()=>{
              //保存成功提示
              promptAction.showToast({
                message: '保存成功',
                duration: 2000,
                bottom: 50
              });

              //处理点击事件

              let editUser:EditUser = {
                username: this.name,
                signature: '这个人很懒，什么都没有留下',
                gender: this.selectedIndex,
                hobbies: this.hobby,
                email: this.email,
                phoneNumber: this.phone,
              }
              UserRequest.editUserInfo(editUser).then((res)=>{
                console.info('editUserInfo',res)
              }).catch((err)=>{
                console.info('editUserInfo',err)
              })


              //处理点击事件
              router.pushUrl(
                { url: 'pages/PersonalPageCard',
                  params: {
                  }}
              );
            })


        }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(15)
      }.width('100%').height(50).alignItems(HorizontalAlign.Center)




      Row(){
        Image(this.userImage).width(100).height(100).border({color:'red',width:1}).borderRadius(50)
      }
      .width('100%')
      .height('24%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F3F3F3')
      // .border({color:'red',width:1})


      Row(){
        Column(){
          TextInput({placeholder:'名字', text:this.name}).width('100%').height(80).backgroundColor('white')
            .onChange((value:string)=>{
              this.name = value
              console.log("---ooo---" + this.name)
            })


          // TextPicker({ range: this.fruits, selected: this.select })
          //   .onChange((value: string, index: number) => {
          //     console.info('Picker item changed, value: ' + value + ', index: ' + index)
          //   })
          TextInput({placeholder:'性别',text:this.genderSelect}).width('100%').height(80).backgroundColor('white')
            .onClick(() => {
              TextPickerDialog.show({
                range: this.gender, //设置文本选择器的选择范围
                selected: this.selectedIndex, //设置选中的索引
                onAccept: (value: TextPickerResult) => { //确定按钮的回调函数
                  this.selectedIndex = value.index;
                  this.genderSelect = value.value;
                },
                onCancel: () => { //取消按钮的回调函数
                  console.info('取消选择')
                },
                onChange: (value: TextPickerResult) => { //选择器选中内容发生变化时触发的回调函数
                  console.info(`当前文本:${JSON.stringify(value)}`)
                } })
            })



          TextInput({placeholder:'爱好', text : this.hobby}).width('100%').height(80).backgroundColor('white').onChange((value:string)=>{
            this.hobby = value
            console.log("---ooo---" + this.hobby)
          })
          TextInput({placeholder:'手机号码' , text:this.phone}).width('100%').height(80).backgroundColor('white').onChange((value:string)=>{
            this.phone = value
            console.log("---ooo---" + this.phone)
          })
          TextInput({placeholder:'邮箱' , text:this.email}).width('100%').height(80).backgroundColor('white').onChange((value:string)=>{
            this.email = value
            console.log("---ooo---" + this.email)
          })

        }
      }



    }.width('100%')
    .height('100%')

  }
}