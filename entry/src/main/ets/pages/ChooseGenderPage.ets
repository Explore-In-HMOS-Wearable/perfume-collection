import {
  ArcButton,
  ArcButtonOptions,
  ArcButtonStyleMode,
  ArcButtonPosition,
  LengthMetrics,
  LengthUnit,
  ColorMetrics
} from '@kit.ArkUI';
import { RouteNames } from '../constants/RouteNames';

@Builder
export function ChooseGenderPageBuilder() {
  ChooseGenderPage()
}

@Entry
@Component
struct ChooseGenderPage {
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      RelativeContainer() {
        ArcButton({
          options: new ArcButtonOptions({
            label: $r('app.string.woman'),
            position: ArcButtonPosition.TOP_EDGE,
            styleMode: ArcButtonStyleMode.CUSTOM,
            backgroundColor: ColorMetrics.resourceColor($r('app.color.button_background')),
            fontColor: ColorMetrics.resourceColor($r('app.color.text_on_dark')),
            fontSize: new LengthMetrics(17, LengthUnit.FP),
            onClick: () => {
              this.pathStack.pushPathByName(RouteNames.PERFUME_PAGE, null);
            }
          })
        })
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })

        ArcButton({
          options: new ArcButtonOptions({
            label: $r('app.string.man'),
            position: ArcButtonPosition.BOTTOM_EDGE,
            styleMode: ArcButtonStyleMode.CUSTOM,
            backgroundColor: ColorMetrics.resourceColor($r('app.color.button_background')),
            fontColor: ColorMetrics.resourceColor($r('app.color.text_on_dark')),
            fontSize: new LengthMetrics(17, LengthUnit.FP),
            onClick: () => {
              this.pathStack.pushPathByName(RouteNames.PERFUME_PAGE, null);
            }
          })
        })
          .alignRules({
            bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.page_background'))
    }
    .hideBackButton(true)
  }
}
