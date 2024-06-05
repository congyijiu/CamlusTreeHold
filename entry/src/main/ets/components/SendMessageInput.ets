

@Preview
@Component
export struct SendMessageInput{
  @State myText: string = '';
  @Link senderMessage:string[];
  build(){
    Row(){
      TextInput({placeholder:'请输入'})
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(300)
        .height(40)
        .margin(20)
        .fontSize(14)
        .fontColor(Color.Black)
        .inputFilter('[a-z]', (e) => {
          console.log(JSON.stringify(e))
        })
        .onChange((value: string) => {
          this.myText = value
          console.log('12312234',this.myText)
        })
      Button('发送')
        .onClick(() => {
          console.log('12312234')
          //将myText的值添加到senderMessage数组中
          this.senderMessage.push(this.myText)
          this.myText = ''
        })
    }.width('100%').height(100)


  }

}