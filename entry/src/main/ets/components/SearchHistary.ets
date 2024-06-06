
import router from '@ohos.router';
import { PreferencesUtil } from '../common/PreferencesUtil';
@Preview
@Component
export struct SearchHistary {


  @Link searchHistary:Array<string>;

  @State theCartColor:string = '#FFFFFF'

  aboutToAppear(){
    console.info('aboutToAppear')

    // PreferencesUtil.getPreferenceValue('MyPreferences','searchHistary','').then((value)=>{
    //   if(value != ''){
    //     this.searchHistary = JSON.parse(value as unknown as string)
    //   }
    // })
  }

  commentAnimal(){
    animateTo({
      duration: 150,
      curve: Curve.EaseOut,
      iterations: 1,
      playMode: PlayMode.Normal,
      onFinish: () => {
        this.theCartColor = '#ffffff'
      }
    }, () => {
      this.theCartColor = '#F0F0F0'
    })
  }

  build(){
    Column(){
      Row(){
        Text('搜索历史')
          .fontWeight('bold')
          .fontSize(16)
        Blank()
        Text('清空')
          .onClick(()=>{
            this.searchHistary = []
            PreferencesUtil.putPreferenceValue('MyPreferences','searchHistary',JSON.stringify(this.searchHistary))
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Flex({wrap:FlexWrap.Wrap}){
          ForEach(this.searchHistary,(item,index)=>{
            Text(item)
              .padding(5)
              .fontSize(14)
              .borderRadius(20)
              .borderWidth(1)
              .borderColor('#ccc')
              .margin(5)
              .backgroundColor(this.theCartColor)
              .onClick(()=>{
                router.pushUrl(
                  { url: 'pages/SearchPage',
                    params: {
                      keyword: item
                    }
                  }
                )
              })
          })
      }
      .width('85%')
      .margin({top:5})
    }
    .width('90%')
    .alignItems(HorizontalAlign.Start)
    .margin({top:10,bottom:10})
  }
}