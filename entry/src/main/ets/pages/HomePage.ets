import { dummyPerfume, Perfume } from '../model/PerfumeModel';

@Builder
export function HomePageBuilder() {
  HomePage()
}

@Entry
@Component
struct HomePage {
  @State selectedPerfume: Perfume | null = null;
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {

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
              this.pathStack.pushPath({
                name: 'PerfumeOfTheDayPage',
                param:
                {
                  name: this.selectedPerfume.name,
                  image: this.selectedPerfume.image,
                  category: this.selectedPerfume.category,
                  description: this.selectedPerfume.description,
                } as Perfume
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
          this.pathStack.pushPathByName('ChooseGenderPage', null)
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
          this.pathStack.pushPathByName('FavoritesPage', null)
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ffd4c890')

    }
    .hideBackButton(true)
  }
}