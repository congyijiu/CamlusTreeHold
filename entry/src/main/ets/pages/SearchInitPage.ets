import { PreferencesUtil } from '../common/PreferencesUtil'
import { CampusHot } from '../components/CampusHot'
import { SearchHistary } from '../components/SearchHistary'
import { SearchTopInput } from '../components/SearchTopInput'
@Entry
@Component
struct SearchInitPage {
  @State message: string = 'Hello World'
  @State searchHistary:Array<string> = [];

  onPageShow() {
    console.log('SearchInitPage onPageShow')
    PreferencesUtil.getPreferenceValue('MyPreferences','searchHistary','').then((value)=>{
      if(value != ''){
        this.searchHistary = JSON.parse(value as unknown as string)
      }
    })
  }

  build() {
    Row() {
      Column() {
        SearchTopInput()
        SearchHistary({searchHistary:$searchHistary})
        CampusHot()
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#FFFFFF')
    }
  }
}