import { curves } from '@kit.ArkUI';
import { RouteNames } from '../constants/RouteNames';
import { AppConstants } from '../constants/AppConstants';
import { HomePageBuilder } from './HomePage';
import { MenuPageBuilder } from './MenuPage';
import { ChooseGenderPageBuilder } from './ChooseGenderPage';
import { PerfumePageBuilder } from './PerfumePage';
import { PerfumeDetailPageBuilder } from './PerfumeDetailPage';
import { PerfumeOfTheDayPageBuilder } from './PerfumeOfTheDayPage';
import { FavoritesPageBuilder } from './FavoritesPage';

@Entry
@Component
struct SplashPage {
  private timerId: number = 0;
  @State earthTranslateY: number = 300;
  @Provide('mainStack') pathStack: NavPathStack = new NavPathStack();

  @Builder
  pageMap(name: string) {
    if (name === RouteNames.HOME_PAGE) {
      HomePageBuilder();
    } else if (name === RouteNames.MENU_PAGE) {
      MenuPageBuilder();
    } else if (name === RouteNames.CHOOSE_GENDER_PAGE) {
      ChooseGenderPageBuilder();
    } else if (name === RouteNames.PERFUME_PAGE) {
      PerfumePageBuilder();
    } else if (name === RouteNames.PERFUME_DETAIL_PAGE) {
      PerfumeDetailPageBuilder();
    } else if (name === RouteNames.PERFUME_OF_THE_DAY_PAGE) {
      PerfumeOfTheDayPageBuilder();
    } else if (name === RouteNames.FAVORITES_PAGE) {
      FavoritesPageBuilder();
    } else {
      NavDestination() {
        Text($r('app.string.unknown_route'))
          .fontColor($r('app.color.text_on_dark'))
      }
    }
  }

  aboutToAppear() {
    this.timerId = setTimeout(() => {
      this.pathStack.pushPath({
        name: RouteNames.HOME_PAGE
      });
    }, AppConstants.SPLASH_DELAY_MS);
  }

  onDestroy() {
    if (this.timerId) {
      clearTimeout(this.timerId);
    }
  }

  build() {
    Navigation(this.pathStack) {
      Stack() {
        Column() {
          Image($r('app.media.splash'))
            .width(120)
            .height(80)
            .translate({ y: this.earthTranslateY })
            .animation({
              curve: curves.initCurve(),
              iterations: 1,
              duration: AppConstants.SPLASH_ANIMATION_DURATION,
              playMode: PlayMode.Alternate
            })
            .onAppear(() => {
              this.earthTranslateY = 10;
            })
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.splash_background'))
    }
    .navDestination(this.pageMap)
    .hideTitleBar(true)
  }
}
