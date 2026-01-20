/**
 *AUTHOR:AbnerMing
 *DATE:2026/1/12
 *INTRODUCE:图形页面
 */
import { ActionBar } from '../../view/ActionBar'

@Entry
@Component
struct ChartPage {
  private menuArray: string[] = ["饼状图", "散点图"]
  private routerArray: string[] = ["chart/PieChartPage", "chart/ScatterChartPage"]

  build() {
    Column() {
      ActionBar({ title: "图表库" })
      Grid() {
        ForEach(this.menuArray, (item: string, index: number) => {
          GridItem() {
            Column() {
              Text(item)
                .fontSize($r("app.float.text_14"))
                .fontColor($r("app.color.title_color"))
                .fontWeight(FontWeight.Bold)
            }
            .width("100%")
            .padding({ top: $r("app.float.view_10"), bottom: $r("app.float.view_10") })
            .backgroundColor($r("app.color.author_info_bg"))
            .borderRadius($r("app.float.view_5"))
            .onClick(() => {
              this.getUIContext().getRouter().pushUrl({ url: "pages/" + this.routerArray[index] })
            })
          }
        })
      }.columnsTemplate("1fr 1fr 1fr")
      .rowsGap($r("app.float.view_10"))
      .columnsGap($r("app.float.view_10"))
      .padding({ left: $r("app.float.view_10"), right: $r("app.float.view_10") })
    }
    .height('100%')
    .width('100%')
    .backgroundColor($r("app.color.home_select_color"))
  }
}