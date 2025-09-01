import { Perfume } from '../model/PerfumeModel';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct PerfumeOfTheDayPage {
  params: Perfume = router.getParams() as Perfume;

  build() {
    Column() {
      Text('💕 Perfume of Today 💕')
        .fontColor("#333")
        .fontSize(15)
        .fontWeight(700)
        .padding({ bottom: 10 })

      Image(this.params.image)
        .height(100)
        .width(120)
        .borderRadius(10)
        .objectFit(ImageFit.Contain)
        .padding({ bottom: 5 })

      Text(this.params.name).fontSize(11).fontWeight(FontWeight.Bold).fontColor(Color.Black).padding({ bottom: 2 })
      Text(this.params.category).fontSize(9).fontColor(Color.Black)

    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Pink)
    .width('100%')
    .height('100%')

  }
}