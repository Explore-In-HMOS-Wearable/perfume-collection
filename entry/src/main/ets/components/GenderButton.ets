import { ButtonComponent } from './ButtonComponent'

@Component
export struct GenderButton {
  @Prop image: ResourceStr
  @Prop title: string
  @Prop backgroundCol: string

  build() {
    Row() {
      Image(this.image)
        .width(16)
        .height(16)
        .margin(10)
      ButtonComponent({ title: this.title, backgroundCol: this.backgroundCol })
    }
    .backgroundColor(this.backgroundCol)
    .borderRadius(50)
    .width('70%')
    .margin({ bottom: 6 })

  }
}