@Entry
@Component
struct Index {
  build() {
    Column() {
      Button("滑块验证")
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/SliderPage" })
        })
      Button("App内打印日志")
        .margin({ top: 10 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/AppLogPage" })
        })
      Button("数字加减框")
        .margin({ top: 10 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/NumberBoxPage" })
        })
      Button("星级评分")
        .margin({ top: 10 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/StarRatingPage" })
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}


