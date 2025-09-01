@Component
export struct SearchBar {
  @Prop placeholder: ResourceStr = '';
  @Prop color: ResourceStr
  onSearch: (type: string) => void = () => {
  };

  build() {
    Search({ placeholder: this.placeholder })
      .searchIcon({
        src: $r('app.media.search'),
        size: 13
      })
      .fontColor(Color.Black)
      .placeholderColor(Color.Gray)
      .placeholderFont({
        size: 13
      })
      .maxFontSize(13)
      .minFontSize(13)
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