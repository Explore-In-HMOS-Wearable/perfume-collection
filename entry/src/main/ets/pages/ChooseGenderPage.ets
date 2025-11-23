import { GenderButton } from '../components/GenderButton'

@Builder
export function ChooseGenderPageBuilder() {
  ChooseGenderPage()
}

@Entry
@Component
struct ChooseGenderPage {
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {

      Column() {

        GenderButton({ image: $r('app.media.female'), title: 'WOMAN', backgroundCol: '#ff8c7b2f' })
          .onClick(() => {
            this.pathStack.pushPathByName('PerfumePage', null)
          })

        GenderButton({ image: $r('app.media.male'), title: 'MAN', backgroundCol: '#ff8c7b2f' })
          .onClick(() => {
            this.pathStack.pushPathByName('MenuPage', null)
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ffd4c890')
    }
    .hideBackButton(true)

  }
}