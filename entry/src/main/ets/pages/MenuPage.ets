import { RouteNames } from '../constants/RouteNames';

@Builder
export function MenuPageBuilder() {
  MenuPage()
}

@Entry
@Component
struct MenuPage {
  @Consume('mainStack') pathStack: NavPathStack;

  aboutToAppear(): void {
    this.pathStack.replacePathByName(RouteNames.CHOOSE_GENDER_PAGE, null);
  }

  build() {
    NavDestination() {
      Column()
        .width('100%')
        .height('100%')
        .backgroundColor($r('app.color.page_background'))
    }
    .hideBackButton(true)
  }
}
