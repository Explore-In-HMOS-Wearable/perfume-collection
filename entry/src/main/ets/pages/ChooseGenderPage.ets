import { router } from '@kit.ArkUI'
import { GenderButton } from '../components/GenderButton'

@Entry
@Component
struct ChooseGenderPage {
  build() {
    Column() {

      GenderButton({ image: $r('app.media.female'), title: 'WOMAN', backgroundCol: '#ff8c7b2f' })
        .onClick(() => {
          router.pushUrl({ url: 'pages/PerfumePage' })
        })

      GenderButton({ image: $r('app.media.male'), title: 'MAN', backgroundCol: '#ff8c7b2f' })
        .onClick(() => {
          router.pushUrl({ url: 'pages/MenuPage' })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#ffd4c890')
  }
}