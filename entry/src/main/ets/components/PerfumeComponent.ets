@Component
export struct PerfumeComponent {
  @Prop name: string
  @Prop image: ResourceStr
  @Prop category: string
  @State favImage: ResourceStr = $r('app.media.fav');
  @State isFavorite: boolean = false

  build() {
    Column() {
      Stack() {
        Image(this.image)
          .height(100)
          .width(120)
          .borderRadius(10)
          .objectFit(ImageFit.Contain)
          .padding({ bottom: 5 })
        Image(this.favImage)
          .width(17)
          .height(17)
          .padding({ top: 4, right: 4 })
          .onClick(() => {
            this.isFavorite = !this.isFavorite
            this.favImage = this.isFavorite ? $r('app.media.full_fav') : $r('app.media.fav')
          })

      }.alignContent(Alignment.TopEnd)

      Text(this.name).fontSize(11).fontColor(Color.Black).padding({ bottom: 2 })
      Text(this.category).fontSize(9).fontColor(Color.Black)

    }.padding(2).width('70%').borderRadius(20)

  }
}