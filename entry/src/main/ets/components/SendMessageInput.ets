

@Preview
@Component
export struct SendMessageInput{
  @State myText: string = ""
  controller: TextInputController = new TextInputController()
  build(){
    Row(){
      TextInput({text: this.myText, controller: this.controller,placeholder:'请输入'})
        .placeholderColor(Color.Grey)
        .placeholderFont({ size: 14, weight: 400 })
        .caretColor(Color.Blue)
        .width(200)
        .height(40)
        .margin(20)
        .fontSize(14)
        .fontColor(Color.Black)
        .inputFilter('[a-z]', (e) => {
          console.log(JSON.stringify(e))
        })
        .onChange((value: string) => {
          this.myText = value
        })
      Button('发送')
        .onClick(() => {
          console.log(this.myText)
        })
    }.width('100%').height(100)


  }
}