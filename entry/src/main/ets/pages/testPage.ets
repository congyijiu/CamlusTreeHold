import router from '@ohos.router'
@Entry
@Component
struct TestPage {


  @State private Id: string = '1';
  @State private title: string = 'Hello World';
  @State private imageUri: string = 'https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp,https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp';

  onPageShow(){
    const params = router.getParams(); // 获取传递过来的参数对象
    this.Id = params['id']; // 获取传递过来的参数id
    this.title = params['title']; // 获取传递过来的参数title
    this.imageUri = params['imageUri']; // 获取传递过来的参数imageUri
    console.log('onPageShow', this.Id);
  }

  build() {
    Column() {
      Blank()
        .height(20)

      // 配置Exchange类型的共享元素转场，共享元素id为"sharedImage1"
      Image(this.imageUri)
        .width(360)
        .sharedTransition(`image${this.Id}`, { duration: 250, curve: Curve.Linear })
        .onClick(() => {
          // 点击图片时路由返回至上一页面
          router.back();
        })
      Row(){
        Text(this.title)
          .fontSize(30)
          .sharedTransition(`title${this.Id}`, { duration: 250, curve: Curve.Linear })
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