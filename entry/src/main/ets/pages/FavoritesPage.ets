import {
  ArcList,
  ArcListItem,
  ArcListAttribute,
  ArcListItemAttribute,
  LengthMetrics,
  ComponentContent
} from '@kit.ArkUI';
import { dummyPerfume, Perfume } from '../model/PerfumeModel';
import { PreferencesService } from '../service/PreferencesService';
import { RouteNames } from '../constants/RouteNames';

@Builder
function emptyHeader() {
  Column().width(1).height(1)
}

@Builder
export function FavoritesPageBuilder() {
  FavoritesPage()
}

@Entry
@Component
struct FavoritesPage {
  @Consume('mainStack') pathStack: NavPathStack;
  @State favoritePerfumes: Array<Perfume> = [];
  private preferencesService: PreferencesService = PreferencesService.getInstance();
  private arcListHeader: ComponentContent<Object> | null = null;

  private loadFavorites(): void {
    let ids = this.preferencesService.getFavoriteIds();
    this.favoritePerfumes = dummyPerfume.filter(p => ids.indexOf(p.id) !== -1);
  }

  aboutToAppear(): void {
    this.arcListHeader = new ComponentContent(this.getUIContext(), wrapBuilder(emptyHeader));
    this.loadFavorites();
  }

  build() {
    NavDestination() {
      Column() {
        Text($r('app.string.favorites'))
          .fontColor($r('app.color.text_primary'))
          .fontSize(15)
          .fontWeight(700)
          .padding({ bottom: 10, top: 10 })

        if (this.favoritePerfumes.length === 0) {
          Column() {
            Image($r('app.media.fav'))
              .width(40)
              .height(40)
              .margin({ bottom: 10 })

            Text($r('app.string.no_favorites'))
              .fontSize(12)
              .fontColor($r('app.color.text_secondary'))
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .layoutWeight(1)
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
        } else {
          Stack() {
            ArcList({ initialIndex: 0, header: this.arcListHeader! }) {
              ForEach(this.favoritePerfumes, (perfume: Perfume) => {
                ArcListItem() {
                  Row() {
                    Image(perfume.image)
                      .width(70)
                      .height(70)
                      .objectFit(ImageFit.Contain)
                      .flexShrink(0)

                    Column() {
                      Text(perfume.name)
                        .fontSize(13)
                        .fontWeight(FontWeight.Medium)
                        .fontColor($r('app.color.text_on_dark'))
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .width('100%')

                      Text(perfume.category)
                        .fontSize(10)
                        .fontColor($r('app.color.text_on_dark'))
                        .maxLines(1)
                        .textOverflow({ overflow: TextOverflow.Ellipsis })
                        .width('100%')
                        .margin({ top: 4 })
                    }
                    .layoutWeight(1)
                    .alignItems(HorizontalAlign.Start)
                    .padding({ left: 8, right: 4 })
                  }
                  .width('100%')
                  .height('100%')
                  .alignItems(VerticalAlign.Center)
                  .padding({ left: 16, right: 16 })
                }
                .borderRadius('65px')
                .width('414px')
                .height('110px')
                .backgroundColor($r('app.color.arc_list_item_bg'))
                .onClick(() => {
                  this.pathStack.pushPath({
                    name: RouteNames.PERFUME_DETAIL_PAGE,
                    param: {
                      id: perfume.id,
                      name: perfume.name,
                      image: perfume.image,
                      category: perfume.category,
                      description: perfume.description
                    } as Perfume
                  });
                })
              }, (perfume: Perfume) => perfume.id)
            }
            .space(LengthMetrics.px(10))
            .focusable(true)
            .focusOnTouch(true)
            .defaultFocus(true)
            .digitalCrownSensitivity(CrownSensitivity.LOW)
          }
          .width('100%')
          .layoutWeight(1)
        }
      }
      .backgroundColor($r('app.color.page_background'))
      .width('100%')
      .height('100%')
    }
    .hideBackButton(true)
    .onShown(() => {
      this.loadFavorites();
    })
  }
}
