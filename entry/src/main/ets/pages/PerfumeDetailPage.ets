import { PerfumeDetailComponent } from '../components/PerfumeDetailComponent';
import { defaultPerfume, Perfume } from '../model/PerfumeModel';

@Builder
export function PerfumeDetailPageBuilder() {
  PerfumeDetailPage()
}

@Entry
@Component
struct PerfumeDetailPage {
  scroller: Scroller = new Scroller()
  @Consume('mainStack') pathStack: NavPathStack;
  @State perfume: Perfume = defaultPerfume;

  aboutToAppear(): void {
    // get the parameters
    this.perfume = this.pathStack.getParamByName('PerfumeDetailPage')[0] as Perfume
  }

  build() {
    NavDestination() {

      Column() {
        PerfumeDetailComponent({
          image: this.perfume.image,
          name: this.perfume.name,
          category: this.perfume.category,
          description: this.perfume.description
        })
      }
    }
    .hideBackButton(true)
  }
}
