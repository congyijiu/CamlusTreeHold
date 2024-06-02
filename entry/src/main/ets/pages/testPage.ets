import router from '@ohos.router'
@Entry
@Component
struct TestPage {

  @State imageId: string = 'image'
  @State titleId: string = 'title'

  onPageShow(){
    const params = router.getParams(); // 获取传递过来的参数对象
    this.imageId = params['imageId']; // 获取id属性的值
    this.titleId = params['titleId']; // 获取age属性的值
    console.log('imageId:', this.imageId);
    console.log('titleId:', this.titleId);
  }

  build() {
    Column() {
      Blank()
        .height(20)

      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image($r('app.media.img'))
        .width(360)
        .sharedTransition(this.imageId, { duration: 250, curve: Curve.Linear })
        .onClick(() => {
          // 点击图片时路由返回至上一页面
          router.back();
        })
      Row(){
        Text(`${this.titleId}`)
          .fontSize(30)
          .sharedTransition(this.titleId, { duration: 250, curve: Curve.Linear })
          .margin({ top: 10 })
          .width("100%")
          .border({ width: 1, color: '#000000' })
      }
    }
    .width("100%")
    .alignItems(HorizontalAlign.Center)
  }

  pageTransition() {
    PageTransitionEnter({ type: RouteType.None, duration: 0 })
    PageTransitionExit({ type: RouteType.None, duration: 0 })
  }

}