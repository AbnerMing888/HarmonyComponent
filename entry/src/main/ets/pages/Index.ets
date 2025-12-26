@Entry
@Component
struct Index {
  build() {
    Column() {
      Button("滑块验证")
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/SliderPage" })
        })
      Button("性能检测")
        .margin({ top: 10 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/MonitorPage" })
        })
      Button("App内打印日志")
        .margin({ top: 10 })
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: "pages/AppLogPage" })
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }

}


