
import router from '@ohos.router';
import { backimage } from '../common/common';
@Preview
@Component
export struct SearchTopInput {

  search(){
    console.log('search in SearchTopInput',this.keyword)
    router.pushUrl(
      { url: 'pages/SearchPage',
        params: {
          keyword: this.keyword
        }}
    )
  }

  @State keyword: string = ''

  build(){
    Row(){
      Image(backimage)
        .width(25)
        .onClick(()=>{
          router.back()
        })
      TextInput({placeholder: '请输入搜索内容'})
        .width('80%')
        .height(40)
        .margin({left: 10})
        .onChange((value)=>{
          this.keyword = value
          console.log(value)
        })
      Blank()
      Text('搜索')
        .fontColor('#75787A')
        .onClick(()=>{
          this.search()
        })
    }
    .width('90%')
    .justifyContent(FlexAlign.Start)
    .margin({top: 5,bottom: 5})
  }
}