import { router } from '@kit.ArkUI';
import { PerfumeDetailComponent } from '../components/PerfumeDetailComponent';
import { Perfume } from '../model/PerfumeModel';

@Entry
@Component
struct PerfumeDetailPage {
  scroller: Scroller = new Scroller()
  params: Perfume = router.getParams() as Perfume;

  build() {
    Column() {
      PerfumeDetailComponent({
        image: this.params.image,
        name: this.params.name,
        category: this.params.category,
        description: this.params.description
      })
    }
  }
}
