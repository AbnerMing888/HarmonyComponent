@Entry
@Component
struct Index {
  build() {
    Column() {
      Button("滑块验证")
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/SliderPage" })
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
