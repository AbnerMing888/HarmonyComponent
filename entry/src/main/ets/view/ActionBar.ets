import { WindowUtils } from "../utils/WindowUtils";

/**
 *AUTHOR:AbnerMing
 *DATE:2025/12/30
 *INTRODUCE:
 */
@ComponentV2
export struct ActionBar {
  @Local windowTopNavHeight: number = 0;
  @Param title?: string = ""
  @Param rightText?: string = ""
  @Param leftClick?: () => void = undefined
  @Param rightClick?: () => void = undefined
  @Param @Once isBackWhite: boolean = false
  @Param titleOpacity: number = 1
  @Param @Once hideLeftBack?: boolean = false

  aboutToAppear(): void {
    this.windowTopNavHeight = this.getUIContext().px2vp(WindowUtils.windowTopNavHeight)
  }

  build() {
    RelativeContainer() {

      Image(this.isBackWhite ? $r("app.media.common_back_white") : $r("app.media.common_back"))
        .width($r("app.float.view_20"))
        .height($r("app.float.view_20"))
        .margin({ left: $r("app.float.view_20") })
        .visibility(this.hideLeftBack ? Visibility.None : Visibility.Visible)
        .onClick(() => {
          if (this.leftClick != undefined) {
            this.leftClick()
          } else {
            this.getUIContext().getRouter().back()
          }
        })
        .alignRules({
          center: { anchor: "__container__", align: VerticalAlign.Center }
        })

      if (this.title != "") {
        Text(this.title)
          .fontColor($r("app.color.action_bar_color"))
          .fontSize($r("app.float.text_16"))
          .fontWeight(FontWeight.Bold)
          .opacity(this.titleOpacity)
          .alignRules({
            middle: { anchor: "__container__", align: HorizontalAlign.Center },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          })
      }
      if (this.rightText != "") {
        Text(this.rightText)
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
          .fontWeight(FontWeight.Bold)
          .margin({ right: $r("app.float.view_20") })
          .alignRules({
            right: { anchor: "__container__", align: HorizontalAlign.End },
            center: { anchor: "__container__", align: VerticalAlign.Center }
          })
          .onClick(this.rightClick)
      }

    }.width("100%")
    .height($r("app.float.view_44"))
    .margin({ top: this.windowTopNavHeight })
  }
}