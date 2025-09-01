import { router } from '@kit.ArkUI'
import { ButtonComponent } from '../components/ButtonComponent'

@Entry
@Component
struct MenuPage {
  build() {
    Column() {

      ButtonComponent({ title: 'Perfume', background_color: '#ff8c7b2f' })
        .onClick(() => {
          router.pushUrl({ url: 'pages/PerfumePage' })
        })
      ButtonComponent({ title: 'Deodorant', background_color: '#ff8c7b2f' })
        .onClick(() => {
          router.pushUrl({ url: 'pages/PerfumePage' })
        })
        .onClick(() => {
          router.pushUrl({ url: 'pages/PerfumePage' })
        })
      ButtonComponent({ title: 'Air Freshener', background_color: '#ff8c7b2f' })
        .onClick(() => {
          router.pushUrl({ url: 'pages/PerfumePage' })
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#ffd4c890')

  }
}
