import { curves } from '@kit.ArkUI';
import { HomePageBuilder } from './HomePage';
import { MenuPageBuilder } from './MenuPage';
import { PerfumePageBuilder } from './PerfumePage';
import { PerfumeDetailPageBuilder } from './PerfumeDetailPage';
import { PerfumeOfTheDayPageBuilder } from './PerfumeOfTheDayPage';
import { ChooseGenderPageBuilder } from './ChooseGenderPage';
import { FavoritesPageBuilder } from './FavoritesPage';

@Entry
@Component
struct SplashPage {
  private timerId = 0;
  planeOffsetX: number = -400;
  planeOffsetY: number = 350;
  @State earthTranslateY: number = 300;
  @Provide('mainStack') pathStack: NavPathStack = new NavPathStack()
  uiContext: UIContext | undefined = undefined;

  @Builder
  pageMap(name: string) {
    if (name === 'HomePage') {
      HomePageBuilder();
    } else if (name === 'MenuPage') {
      MenuPageBuilder();
    } else if (name === 'PerfumePage') {
      PerfumePageBuilder();
    } else if (name === 'PerfumeDetailPage') {
      PerfumeDetailPageBuilder();
    } else if (name === 'PerfumeOfTheDayPage') {
      PerfumeOfTheDayPageBuilder();
    } else if (name === 'ChooseGenderPage') {
      ChooseGenderPageBuilder();
    } else if (name === 'FavoritesPage') {
      FavoritesPageBuilder();
    } else {
      NavDestination() { Text(`Unknown route: ${name}`).fontColor(Color.White) }
    }
  }

  aboutToAppear() {
    setTimeout(() => {
      this.startPlaneAnimation();
    }, 100);

    this.timerId = setTimeout(() => {
      this.pathStack.pushPath({
        name: 'HomePage'
      });
    }, 2000);
  }

  startPlaneAnimation() {
    this.uiContext?.animateTo({
      curve: curves.initCurve(),
      duration: 4500,
      delay: 0,
      iterations: 1,
      playMode: PlayMode.Normal
    }, () => {
      this.planeOffsetX = 500;
      this.planeOffsetY = -150;
    });
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
              duration: 500,
              playMode: PlayMode.Alternate
            })
            .onAppear(() => {
              this.earthTranslateY = 10;
            })
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Black)
    }
    .navDestination(this.pageMap)
    .hideTitleBar(true)
  }
}