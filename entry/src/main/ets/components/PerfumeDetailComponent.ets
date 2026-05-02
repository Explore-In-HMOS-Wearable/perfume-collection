@Component
export struct PerfumeDetailComponent {
  @Prop image: ResourceStr = '';
  @Prop name: string = '';
  @Prop category: string = '';
  @Prop description: string = '';
  @Prop isFavorite: boolean = false;
  onToggleFavorite: () => void = () => {};
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Row() {
        Blank()
        Image(this.isFavorite ? $r('app.media.full_fav') : $r('app.media.fav'))
          .width(24)
          .height(24)
          .margin({ right: 50 })
          .onClick(() => {
            this.onToggleFavorite();
          })
      }.width('100%')

      Image(this.image)
        .height(79)
        .width(90)
        .borderRadius(10)
        .objectFit(ImageFit.Contain)
        .padding({ bottom: 5 })

      Text(this.name)
        .fontSize(15)
        .fontColor($r('app.color.text_primary'))
        .fontWeight(FontWeight.Bold)
        .padding({ bottom: 2 })

      Text(this.category)
        .fontSize(13)
        .fontColor($r('app.color.text_primary'))
        .fontStyle(FontStyle.Italic)
        .padding({ bottom: 4 })

      Scroll(this.scroller) {
        Text(this.description)
          .fontSize(13)
          .fontColor($r('app.color.text_primary'))
          .textAlign(TextAlign.Center)
      }
      .height('40%')
      .width('75%')
      .align(Alignment.Center)
      .scrollBar(BarState.Auto)
      .padding({ bottom: 15 })
    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .padding({ top: 20, bottom: 15 })
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}

