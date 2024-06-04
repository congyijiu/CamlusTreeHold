import router from '@ohos.router'
@Preview
@Component
export struct NavigationToolBar {
  currentIndex: number = 0
  @State Build: Array<Object> = [
    {
      text: '首页',
      num: 0
    },
    {
      text: '发布',
      num: 1
    },
    {
      text: '我的',
      num: 2
    },
    {
      text: '消息',
      num: 3
    }
  ]
  build(){
      Row(){
        ForEach(this.Build, item => {
          Column() {
            Text(item.text)
              .fontColor(this.currentIndex == item.num ? '#007DFF' : '#182431')
              .fontSize(16)
              .lineHeight(14)
              .fontWeight(500)
              .margin({ top: 3 })
              .padding({ top: 13 })
          }.width(104).height(40)
          .onClick(() => {
            this.currentIndex = item.num
            if (item.num == 0) {
              router.pushUrl(
                { url: 'pages/Index',
                  params: {
                    num:item.num
                  } },
                router.RouterMode.Single,
                err => {
                  console.log('pushUrl err', err)
                }
              );
            } else if (item.num == 1) {
              router.pushUrl(
                { url: 'pages/PublishPage',
                  params: {
                    num:item.num
                  }
                },
                router.RouterMode.Single,
                err => {
                  console.log('pushUrl err', err)
                }
              );
            } else if (item.num == 2){
              router.pushUrl(
                { url: 'pages/MyPage',
                  params: {
                    num:item.num
                  } },
                router.RouterMode.Single,
                err => {
                  console.log('pushUrl err', err)
                }
              );
            }
            else if (item.num == 3){
              router.pushUrl(
                { url: 'pages/MessagePage',
                  params: {
                    num:item.num
                  } },
                router.RouterMode.Single,
                err => {
                  console.log('pushUrl err', err)
                }
              );
            }
          })
        })
      }.alignItems(VerticalAlign.Center).width('100%')
  }

}