import { StockLine } from '@abner/stock';

@Entry
@Component
struct StockPage {
  build() {
    RelativeContainer() {
      StockLine()
        .height(300)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
    .padding(20)
  }
}