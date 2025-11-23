@Component
export struct PerfumeDetailComponent {
  @Prop image: ResourceStr
  @Prop name: string
  @Prop category: string
  @Prop description: string
  scroller: Scroller = new Scroller()

  build() {
    Column() {
      Image(this.image)
        .height(79)
        .width(90)
        .borderRadius(10)
        .objectFit(ImageFit.Contain)
        .padding({ bottom: 5 })

      Text(this.name)
        .fontSize(15)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .padding({ bottom: 2 })

      Text(this.category)
        .fontSize(13)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .padding({ bottom: 4 })

      Scroll(this.scroller) {
        Text(this.description)
          .fontSize(13)
          .fontColor(Color.Black)
          .textAlign(TextAlign.Center)
      }
      .height('40%')
      .width('75%')
      .align(Alignment.Center)
      .scrollBar(BarState.Auto)
      .padding({ bottom: 15 })
    }
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#ffd4c890')
    .padding({ top: 20, bottom: 15 })
    .width('100%')
    .height('100%')
  }
}