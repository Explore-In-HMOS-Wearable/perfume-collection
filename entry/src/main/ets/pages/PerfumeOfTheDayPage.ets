import { defaultPerfume, Perfume } from '../model/PerfumeModel';
import { RouteNames } from '../constants/RouteNames';

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
    this.perfume = this.pathStack.getParamByName(RouteNames.PERFUME_OF_THE_DAY_PAGE)[0] as Perfume;
  }

  build() {
    NavDestination() {
      Column() {
        Text($r('app.string.perfume_of_today_title'))
          .fontColor($r('app.color.text_primary'))
          .fontSize(15)
          .fontWeight(700)
          .padding({ bottom: 10 })

        Image(this.perfume.image)
          .height(100)
          .width(120)
          .borderRadius(10)
          .objectFit(ImageFit.Contain)
          .padding({ bottom: 5 })

        Text(this.perfume.name)
          .fontSize(11)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .padding({ bottom: 2 })

        Text(this.perfume.category)
          .fontSize(9)
          .fontColor($r('app.color.text_primary'))
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r('app.color.perfume_of_day_bg'))
      .width('100%')
      .height('100%')
    }
    .hideBackButton(true)
  }
}
