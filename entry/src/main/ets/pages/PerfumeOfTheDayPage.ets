import { defaultPerfume, Perfume } from '../model/PerfumeModel';

@Builder
export function PerfumeOfTheDayPageBuilder() {
  PerfumeOfTheDayPage()
}

@Entry
@Component
struct PerfumeOfTheDayPage {
  @Consume('mainStack') pathStack: NavPathStack;
  @State perfume: Perfume = defaultPerfume;

  aboutToAppear(): void {
    // get the parameters
    this.perfume = this.pathStack.getParamByName('PerfumeOfTheDayPage')[0] as Perfume
  }

  build() {
    NavDestination() {

      Column() {
        Text('💕 Perfume of Today 💕')
          .fontColor('#333')
          .fontSize(15)
          .fontWeight(700)
          .padding({ bottom: 10 })

        Image(this.perfume.image)
          .height(100)
          .width(120)
          .borderRadius(10)
          .objectFit(ImageFit.Contain)
          .padding({ bottom: 5 })

        Text(this.perfume.name).fontSize(11).fontWeight(FontWeight.Bold).fontColor(Color.Black).padding({ bottom: 2 })
        Text(this.perfume.category).fontSize(9).fontColor(Color.Black)

      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Pink)
      .width('100%')
      .height('100%')

    }
    .hideBackButton(true)
  }
}