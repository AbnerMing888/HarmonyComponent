import { MonitorUtils, MonitorView } from '@abner/monitor'

@Entry
@Component
struct MonitorPage {
  build() {
    RelativeContainer() {
      Column() {
        Button("开启")
          .onClick(() => {
            MonitorUtils.getMonitor().start(() => {
              this.getUIContext().getRouter().back()
            })
          })
        Button("停止")
          .margin({ top: 10 })
          .onClick(() => {
            MonitorUtils.getMonitor().stop()
          })
      }
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
    }
    .height('100%')
    .width('100%')
  }
}