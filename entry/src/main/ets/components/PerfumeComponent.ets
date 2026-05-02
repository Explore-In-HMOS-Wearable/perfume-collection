@Component
export struct PerfumeComponent {
  @Prop name: string = '';
  @Prop perfumeId: string = '';
  @Prop image: ResourceStr = '';
  @Prop category: string = '';
  @Prop @Watch('onFavoriteChanged') isFavorite: boolean = false;
  @State favImage: ResourceStr = $r('app.media.fav');
  onToggleFavorite: () => void = () => {};

  aboutToAppear(): void {
    this.favImage = this.isFavorite ? $r('app.media.full_fav') : $r('app.media.fav');
  }

  onFavoriteChanged(): void {
    this.favImage = this.isFavorite ? $r('app.media.full_fav') : $r('app.media.fav');
  }

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
            this.onToggleFavorite();
          })
      }.alignContent(Alignment.TopEnd)

      Text(this.name)
        .fontSize(11)
        .fontColor($r('app.color.text_primary'))
        .padding({ bottom: 2 })

      Text(this.category)
        .fontSize(9)
        .fontColor($r('app.color.text_primary'))
    }
    .padding(2)
    .width('70%')
    .borderRadius(20)
  }
}
