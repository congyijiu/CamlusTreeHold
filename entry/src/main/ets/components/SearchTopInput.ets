import router from '@ohos.router';
import { backimage } from '../common/common';
import { PreferencesUtil } from '../common/PreferencesUtil';

@Preview
@Component
export struct SearchTopInput {
  search() {
    console.log('search in SearchTopInput', this.keyword)
    router.pushUrl(
      { url: 'pages/SearchPage',
        params: {
          keyword: this.keyword
        }
      }
    )
    PreferencesUtil.getPreferenceValue('MyPreferences','searchHistary','').then((value) => {
      console.log('searchHistaryjson', value)
      let res = value as unknown as string
      if (res == '') {
        let searchHistary = []
        searchHistary.push(this.keyword)
        PreferencesUtil.putPreferenceValue('MyPreferences','searchHistary',JSON.stringify(searchHistary))
      } else {
        let searchHistary = JSON.parse(res)
        //检查是否已经存在
        let index = searchHistary.indexOf(this.keyword)
        if (index == -1) {
          //放到第一个
          searchHistary.unshift(this.keyword)
          PreferencesUtil.putPreferenceValue('MyPreferences','searchHistary',JSON.stringify(searchHistary))
        }
      }
    })

  }

  @State keyword: string = ''

  build() {
    Row() {
      Image(backimage)
        .width(25)
        .onClick(() => {
          router.back()
        })
      TextInput({ placeholder: '请输入搜索内容' })
        .width('80%')
        .height(40)
        .margin({ left: 10 })
        .onChange((value) => {
          this.keyword = value
          console.log(value)
        })
      Blank()
      Text('搜索')
        .fontColor('#75787A')
        .onClick(() => {
          this.search()
        })
    }
    .width('90%')
    .justifyContent(FlexAlign.Start)
    .margin({ top: 5, bottom: 5 })
  }
}