
import router from '@ohos.router';
@Preview
@Component
export struct testcomponent {

  private imageId: string = '2';
  private titleId: string = '222';


  build(){
    Column(){
      Image($r('app.media.img'))
        .sharedTransition(this.imageId, { duration: 200, curve: Curve.Linear })
        .width('100%')
      Text(`${this.titleId}`)
        .sharedTransition(this.titleId, { duration: 200, curve: Curve.Linear })
        .fontSize(20)
        .fontWeight('bold')
        .fontColor('#000000')
        .width('100%')
    }
    .width('45%')
    .justifyContent(FlexAlign.Center)
  }
}