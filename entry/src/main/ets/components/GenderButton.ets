@Component
export struct GenderButton {
  @Prop image: ResourceStr = '';
  @Prop title: ResourceStr = '';

  build() {
    Row() {
      Image(this.image)
        .width(16)
        .height(16)
        .margin(10)

      Button(this.title)
        .height(50)
        .margin(2)
        .width('60%')
        .backgroundColor($r('app.color.button_background'))
    }
    .backgroundColor($r('app.color.button_background'))
    .borderRadius(50)
    .width('70%')
    .margin({ bottom: 6 })
  }
}
