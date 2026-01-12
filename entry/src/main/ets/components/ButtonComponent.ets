@Component
export struct ButtonComponent {
  @Prop title: string
  @Prop backgroundCol: string

  build() {
    Button(this.title)
      .height(50)
      .margin(2)
      .width('60%')
      .backgroundColor(this.backgroundCol)
  }
}
