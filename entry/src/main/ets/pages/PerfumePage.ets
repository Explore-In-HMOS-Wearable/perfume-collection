import {
  ArcList,
  ArcListItem,
  ArcListAttribute,
  ArcListItemAttribute,
  LengthMetrics,
  ComponentContent
} from '@kit.ArkUI';
import { SearchBar } from '../components/SearchBar';
import { Perfume } from '../model/PerfumeModel';
import { PerfumeViewModel } from '../viewmodel/PerfumeViewModel';
import { PreferencesService } from '../service/PreferencesService';
import { HapticService } from '../service/HapticService';
import { RouteNames } from '../constants/RouteNames';

@Builder
function emptyHeader() {
  Column().width(1).height(1)
}

@Builder
export function PerfumePageBuilder() {
  PerfumePage()
}

@Entry
@Component
struct PerfumePage {
  @State filteredPerfumeList: Array<Perfume> = [];
  @State favoriteIds: string[] = [];
  private viewModel: PerfumeViewModel = new PerfumeViewModel();
  private preferencesService: PreferencesService = PreferencesService.getInstance();
  @Consume('mainStack') pathStack: NavPathStack;
  private arcListHeader: ComponentContent<Object> | null = null;

  aboutToAppear() {
    this.arcListHeader = new ComponentContent(this.getUIContext(), wrapBuilder(emptyHeader));
    this.filteredPerfumeList = this.viewModel.getFilteredPerfumeList();
    this.refreshFavoriteIds();
  }

  private refreshFavoriteIds(): void {
    this.favoriteIds = this.preferencesService.getFavoriteIds().slice();
  }

  private isFavored(perfumeId: string): boolean {
    return this.favoriteIds.indexOf(perfumeId) !== -1;
  }

  private handleFavToggle(perfumeId: string): void {
    this.preferencesService.toggleFavorite(perfumeId);
    if (this.preferencesService.isFavorite(perfumeId)) {
      HapticService.success();
    } else {
      HapticService.soft();
    }
    this.refreshFavoriteIds();
  }

  private onSearch(searchInput: string): void {
    this.viewModel.setSearchQuery(searchInput);
    this.filteredPerfumeList = this.viewModel.getFilteredPerfumeList();
    this.refreshFavoriteIds();
  }

  build() {
    NavDestination() {
      Column() {
        SearchBar({
          onSearch: (searchInput: string) => {
            this.onSearch(searchInput);
          },
          placeholder: $r('app.string.search')
        }).padding({ top: 15, bottom: 2 })

        Stack() {
          ArcList({ initialIndex: 0, header: this.arcListHeader! }) {
            ForEach(this.filteredPerfumeList, (perfume: Perfume) => {
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

                  Image(this.isFavored(perfume.id) ? $r('app.media.full_fav') : $r('app.media.fav'))
                    .width(20)
                    .height(20)
                    .flexShrink(0)
                    .onClick(() => {
                      this.handleFavToggle(perfume.id);
                    })
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
          .digitalCrownSensitivity(CrownSensitivity.MEDIUM)
        }
        .width('100%')
        .layoutWeight(1)
      }
      .backgroundColor($r('app.color.page_background'))
      .width('100%')
      .height('100%')
    }
    .hideBackButton(true)
    .onShown(() => {
      this.refreshFavoriteIds();
    })
  }
}
