import { ArcSwiper, ArcSwiperAttribute, ArcDotIndicator, ArcDirection } from '@kit.ArkUI';
import { dummyPerfume, Perfume } from '../model/PerfumeModel';
import { RouteNames } from '../constants/RouteNames';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';

@Builder
export function HomePageBuilder() {
  HomePage()
}

@Entry
@Component
struct HomePage {
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      Stack() {
        ArcSwiper() {
          // Card 1: Perfume of the Day
          Column() {
            Image($r('app.media.dummyperfume1'))
              .width(60)
              .height(60)
              .borderRadius(30)
              .objectFit(ImageFit.Contain)
              .margin({ bottom: 8 })

            Text($r('app.string.perfume_of_the_day'))
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)
              .padding({ bottom: 4 })

            Text($r('app.string.perfume_of_the_day_desc'))
              .fontSize(10)
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .backgroundColor($r('app.color.page_background'))
          .borderRadius('50%')
          .onClick(() => {
            const randomIndex = Math.floor(this.secureRandomNumber() * dummyPerfume.length);
            let selected = dummyPerfume[randomIndex];
            this.pathStack.pushPath({
              name: RouteNames.PERFUME_OF_THE_DAY_PAGE,
              param: {
                id: selected.id,
                name: selected.name,
                image: selected.image,
                category: selected.category,
                description: selected.description
              } as Perfume
            });
          })

          // Card 2: Perfumes Collection
          Column() {
            Image($r('app.media.dummyperfume3'))
              .width(60)
              .height(60)
              .borderRadius(30)
              .objectFit(ImageFit.Contain)
              .margin({ bottom: 8 })

            Text($r('app.string.perfumes'))
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)
              .padding({ bottom: 4 })

            Text($r('app.string.perfumes_desc'))
              .fontSize(10)
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .backgroundColor($r('app.color.page_background'))
          .borderRadius('50%')
          .onClick(() => {
            this.pathStack.pushPathByName(RouteNames.MENU_PAGE, null);
          })

          // Card 3: Favorites
          Column() {
            Image($r('app.media.full_fav'))
              .width(40)
              .height(40)
              .margin({ bottom: 8 })

            Text($r('app.string.favorites'))
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)
              .padding({ bottom: 4 })

            Text($r('app.string.favorites_desc'))
              .fontSize(10)
              .fontColor($r('app.color.text_primary'))
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
          .backgroundColor($r('app.color.page_background'))
          .borderRadius('50%')
          .onClick(() => {
            this.pathStack.pushPathByName(RouteNames.FAVORITES_PAGE, null);
          })
        }
        .indicator(
          new ArcDotIndicator()
            .arcDirection(ArcDirection.SIX_CLOCK_DIRECTION)
            .itemColor($r('app.color.indicator_inactive'))
            .selectedItemColor($r('app.color.indicator_active'))
        )
        .vertical(false)
        .focusable(true)
        .focusOnTouch(true)
        .defaultFocus(true)
      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.page_background'))
    }
    .hideBackButton(true)
  }

  private secureRandomNumber(): number {
    const rand = cryptoFramework.createRandom();
    const randData = rand.generateRandomSync(8);
    const bytes = randData.data;
    let bigIntValue = BigInt(0);
    for (let i = 0; i < 8; i++) {
      bigIntValue = (bigIntValue << BigInt(8)) | BigInt(bytes[i]);
    }
    const maxSafeValue = BigInt(1) << BigInt(53);
    const normalizedValue = Number(bigIntValue >> BigInt(11)) / Number(maxSafeValue);
    return normalizedValue;
  }
}
