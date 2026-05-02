import { defaultPerfume, Perfume } from '../model/PerfumeModel';
import { PreferencesService } from '../service/PreferencesService';
import { HapticService } from '../service/HapticService';
import { RouteNames } from '../constants/RouteNames';

@Builder
export function PerfumeDetailPageBuilder() {
  PerfumeDetailPage()
}

@Entry
@Component
struct PerfumeDetailPage {
  @Consume('mainStack') pathStack: NavPathStack;
  @State perfume: Perfume = defaultPerfume;
  @State isFavorite: boolean = false;
  private scroller: Scroller = new Scroller();
  private preferencesService: PreferencesService = PreferencesService.getInstance();

  aboutToAppear(): void {
    this.perfume = this.pathStack.getParamByName(RouteNames.PERFUME_DETAIL_PAGE)[0] as Perfume;
    this.isFavorite = this.preferencesService.isFavorite(this.perfume.id);
  }

  private handleToggle(): void {
    this.preferencesService.toggleFavorite(this.perfume.id);
    this.isFavorite = this.preferencesService.isFavorite(this.perfume.id);
    if (this.isFavorite) {
      HapticService.success();
    } else {
      HapticService.soft();
    }
  }

  build() {
    NavDestination() {
      Column() {
        Row() {
          Blank()
          Image(this.isFavorite ? $r('app.media.full_fav') : $r('app.media.fav'))
            .width(24)
            .height(24)
            .margin({ right: 50 })
            .onClick(() => {
              this.handleToggle();
            })
        }.width('100%')
        Image(this.perfume.image)
          .height(79)
          .width(90)
          .borderRadius(10)
          .objectFit(ImageFit.Contain)
          .padding({ bottom: 5 })
        Text(this.perfume.name)
          .fontSize(15)
          .fontColor($r('app.color.text_primary'))
          .fontWeight(FontWeight.Bold)
          .padding({ bottom: 2 })
        Text(this.perfume.category)
          .fontSize(13)
          .fontColor($r('app.color.text_primary'))
          .fontStyle(FontStyle.Italic)
          .padding({ bottom: 4 })
        Scroll(this.scroller) {
          Text(this.perfume.description)
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
    .hideBackButton(true)
  }
}
