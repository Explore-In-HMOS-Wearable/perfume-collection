import { ButtonComponent } from '../components/ButtonComponent'

@Builder
export function MenuPageBuilder() {
  MenuPage()
}

@Entry
@Component
struct MenuPage {
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {
      Column() {

        ButtonComponent({ title: 'Perfume', backgroundCol: '#ff8c7b2f' })
          .onClick(() => {
            this.pathStack.pushPathByName('PerfumePage', null)
          })
        ButtonComponent({ title: 'Deodorant', backgroundCol: '#ff8c7b2f' })
          .onClick(() => {
            this.pathStack.pushPathByName('PerfumePage', null)
          })
          .onClick(() => {
            this.pathStack.pushPathByName('PerfumePage', null)
          })
        ButtonComponent({ title: 'Air Freshener', backgroundCol: '#ff8c7b2f' })
          .onClick(() => {
            this.pathStack.pushPathByName('PerfumePage', null)
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