@Component
export struct SearchBar {
  @Prop placeholder: ResourceStr = '';
  @Prop color: ResourceStr
  onSearch: (type: string) => void = () => {
  };

  build() {
    Search({ placeholder: this.placeholder })
      .searchIcon({
        src: $r('app.media.search')
      })
      .placeholderColor(Color.Black)
      .fontColor(Color.Black)
      .width('60%')
      .height('13%')
      .margin({ top: 8 })
      .backgroundColor(Color.White)
      .borderRadius(16)
      .onChange((value: string) => {
        this.onSearch(value)
      })
      .onSubmit((value: string) => {
        this.onSearch(value)
      })
  }
}