import { router } from '@kit.ArkUI'
import { dummyPerfume, Perfume } from '../model/PerfumeModel';

@Entry
@Component
struct HomePage {
  @State selectedPerfume: Perfume | null = null;

  build() {
    Column() {
      Row() {
        Button('Perfume of the Day')
          .height(50)
          .margin(2)
          .width('100%')
          .backgroundColor('#ff8c7b2f')
          .onClick(() => {
            const randomIndex = Math.floor(Math.random() * dummyPerfume.length);
            this.selectedPerfume = dummyPerfume[randomIndex];
            router.pushUrl({
              url: 'pages/PerfumeOfTheDayPage',
              params: {
                name: this.selectedPerfume.name,
                image: this.selectedPerfume.image,
                category: this.selectedPerfume.category,
                description: this.selectedPerfume.description,
              }
            })
          })
      }
      .borderRadius(50)
      .width('80%')
      .margin({ bottom: 2 })

      Row() {
        Button('Perfumes')
          .height(50)
          .margin(2)
          .width('100%')
          .backgroundColor('#ff8c7b2f')
      }
      .borderRadius(50)
      .width('80%')
      .margin({ bottom: 2 })
      .onClick(() => {
        router.pushUrl({ url: 'pages/ChooseGenderPage' })
      })

      Row() {
        Button('Favorites')
          .height(50)
          .margin(2)
          .width('100%')
          .backgroundColor('#ff8c7b2f')
      }
      .borderRadius(50)
      .width('80%')
      .onClick(() => {
        router.pushUrl({ url: 'pages/FavoritesPage' })
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#ffd4c890')

  }
}