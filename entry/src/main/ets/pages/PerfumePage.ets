import { PerfumeComponent } from '../components/PerfumeComponent';
import { SearchBar } from '../components/SearchBar';
import { Perfume } from '../model/PerfumeModel';
import { PerfumeViewModel } from '../viewmodel/PerfumeViewModel';

@Builder
export function PerfumePageBuilder() {
  PerfumePage()
}

@Entry
@Component
struct PerfumePage {
  scroller: Scroller = new Scroller()
  searchInput: string = '';
  @State filteredPlacesList: Array<Perfume> = []
  private viewModel: PerfumeViewModel = new PerfumeViewModel();
  @Consume('mainStack') pathStack: NavPathStack;

  private onSearch(searchInput: string) {
    this.viewModel.setSearchQuery(searchInput)
    this.filteredPlacesList = this.viewModel.getFilteredPlacesList()
  }

  aboutToAppear() {
    this.filteredPlacesList = this.viewModel.getFilteredPlacesList()
  }

  build() {
    NavDestination() {
      Column() {
        SearchBar({
          onSearch: (searchInput: string) => {
            this.onSearch(searchInput)
          },
          placeholder: $r('app.string.search')
        }).padding({ bottom: 3 })

        Scroll(this.scroller) {
          Column() {
            ForEach(this.filteredPlacesList, (menuItem: Perfume) => {
              PerfumeComponent({
                name: menuItem.name,
                image: menuItem.image,
                category: menuItem.category
              }).padding({ bottom: 4 })
                .onClick(() => {
                  this.pathStack.pushPath({
                    name: 'PerfumeDetailPage',
                    param:
                    {
                      name: menuItem.name,
                      image: menuItem.image,
                      category: menuItem.category,
                      description: menuItem.description
                    } as Perfume
                  })
                })
              Divider().height(2).color(Color.Gray).padding({ left: 40, right: 40, bottom: 10 });
            }, (menuItem: Perfume, index: number) => menuItem.name)
          }.padding({ bottom: 25 })
        }.width('100%').height('100%')
      }.backgroundColor('#ffd4c890').padding({ top: 10, bottom: 10 }).width('100%').height('100%')
    }
    .hideBackButton(true)
  }
}