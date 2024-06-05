import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

@Preview
@Component
export struct editTabCard{



  build(){
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
            router.pushUrl(
              { url: 'pages/PersonalPageCard',
                params: {
                }}
            );
          })


      }.width('100%').justifyContent(FlexAlign.SpaceBetween).padding(15)
    }.width('100%').height(50).alignItems(HorizontalAlign.Center)
}
}