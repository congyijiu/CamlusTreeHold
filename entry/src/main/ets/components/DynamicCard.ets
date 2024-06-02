
import router from '@ohos.router';

export class author {
  name: string;
  avatar: string;
}

@Preview
@Component
export struct DynamicCard {


  private imageId: string = '2';
  private titleId: string = '这是一个标题这是一个标题这是一个标题这是一个标题';
  private author: author = {
    name: '张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三张三',
    avatar: 'app.media.icon'
  };
  build(){
    Column(){
      Image($r('app.media.img'))
        .sharedTransition(this.imageId, { duration: 200, curve: Curve.Linear })
        .width('100%')
        .borderRadius(5)
      Text(`${this.titleId}`)
        .sharedTransition(this.titleId, { duration: 200, curve: Curve.Linear })
        .fontSize(14)
        .fontWeight('bold')
        .fontColor('#000000')
        .width('90%')
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .margin({ top: 5, bottom: 5 })
      Row(){
        Image($r('app.media.icon'))
          .width(20)
          .height(20)
          .borderRadius(25)
          // .border({ width: 1, color: '#000000' })
        Text(`${this.author.name}`)
          .fontSize(12)
          .fontColor('#3C3F41')
          .margin({left: 5})
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          // .border({ width: 1, color: '#000000' })
          .width('70%')
        Blank()
      }
      .width('90%')
      // .border({ width: 1, color: '#000000' })
    }
    .width(172)
    .justifyContent(FlexAlign.Center)
  }
}