@Builder
export function FavoritesPageBuilder() {
  FavoritesPage()
}

@Entry
@Component
struct FavoritesPage {
  @State favImage: ResourceStr = $r('app.media.full_fav');
  isFavorite: boolean = true
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        Text('Favorites')
          .fontColor('#333')
          .fontSize(15)
          .fontWeight(700)
          .padding({ bottom: 10 })
        Stack() {
          Image($r('app.media.dummyperfume2'))
            .height(100)
            .width(120)
            .borderRadius(10)
            .objectFit(ImageFit.Contain)
            .padding({ bottom: 5 })
          Image(this.favImage)
            .width(17)
            .height(17)
            .padding({ top: 4, right: 4 })
        }.alignContent(Alignment.TopEnd)

        Text('Noim Timber').fontSize(11).fontColor(Color.Black).padding({ bottom: 2 })
        Text('Masculine').fontSize(9).fontColor(Color.Black)

      }
      .backgroundColor('#ffd4c890')
      .padding({ top: 10, bottom: 10 })
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)

    }
    .hideBackButton(true)
  }
}