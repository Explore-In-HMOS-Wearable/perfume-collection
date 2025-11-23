import { curves } from '@kit.ArkUI';

@Entry
@Component
struct SplashPage {
  private timerId = 0;
  @State planeOffsetX: number = -400;
  @State planeOffsetY: number = 350;
  @State earthTranslateY: number = 300;
  @Provide('mainStack') pathStack: NavPathStack = new NavPathStack()

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
    animateTo({
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
          Image($r("app.media.splash"))
            .width(120)
            .height(80)
            .translate({ y: this.earthTranslateY })
            .animation({
              curve: curves.initCurve(),
              iterations: 1,
              duration: 500,
              playMode: PlayMode.Alternate,
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
    .hideTitleBar(true)
  }
}