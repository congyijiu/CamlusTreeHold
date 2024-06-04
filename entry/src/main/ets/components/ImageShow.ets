
@Preview
@Component
export struct ImageShow{
  @State ImageUrl: string ='';

  aboutToAppear(){
    console.log('aboutToAppear');
    console.log(this.ImageUrl);
  }
  build(){
    Column(){
      Image(this.ImageUrl)
        .width(100)
        .height(100)
      Image($r('app.media.delete'))
        .width(23)
        .height(23)
        .position({
          x:78,
          y:0
        })
        .onClick(() =>{
          console.log('delete');
          this.ImageUrl = '';
          console.log('delete');
          console.log(this.ImageUrl);
        })
    }

  }
}