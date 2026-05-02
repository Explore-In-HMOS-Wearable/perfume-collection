@Component
export struct SearchBar {
  @Prop placeholder: ResourceStr = '';
  onSearch: (value: string) => void = () => {};

  build() {
    Search({ placeholder: this.placeholder })
      .searchIcon({
        src: $r('app.media.search')
      })
      .width('60%')
      .height('13%')
      .backgroundColor($r('app.color.search_bar_bg'))
      .placeholderColor($r('app.color.text_primary'))
      .placeholderFont({ size: 11 })
      .fontColor($r('app.color.text_primary'))
      .borderRadius(16)
      .onChange((value: string) => {
        this.onSearch(value);
      })
      .onSubmit((value: string) => {
        this.onSearch(value);
      })
  }
}
