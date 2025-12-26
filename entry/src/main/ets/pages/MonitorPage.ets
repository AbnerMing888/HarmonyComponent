import { MonitorView } from '@abner/monitor';

@Entry
@Component
struct MonitorPage {
  build() {
    RelativeContainer() {
      MonitorView()
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
  }
}