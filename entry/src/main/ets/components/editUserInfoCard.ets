@Preview
@Component
export struct editUserInfoCard{
  // @State ImageUrl: string ='';
  private select: number = 1
  gender: string[] = ['男', '女']
  @State selectedIndex: number = 0
  @State genderSelect:string = '男'
  // aboutToAppear(){
  //   console.log('aboutToAppear');
  //   console.log(this.ImageUrl);
  // }

  build(){
    Column(){


      Row(){
        Image('').width(100).height(100).border({color:'red',width:1}).borderRadius(50)
      }
      .width('100%')
      .height('24%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#F3F3F3')
      // .border({color:'red',width:1})


      Row(){
        Column(){
          TextInput({placeholder:'名字'}).width('100%').height(80).backgroundColor('white')
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



          TextInput({placeholder:'爱好'}).width('100%').height(80).backgroundColor('white')
          TextInput({placeholder:'手机号码'}).width('100%').height(80).backgroundColor('white')
          TextInput({placeholder:'邮箱'}).width('100%').height(80).backgroundColor('white')

        }
      }



    }.width('100%')
    .height('100%')

  }
}