import { SliderControl, SliderDragView } from '@abner/slider'

@Entry
@Component
struct SliderPage {
  sliderControl: SliderControl = new SliderControl()
  sliderControl2: SliderControl = new SliderControl()

  @Builder
  defaultView() {
    Column() {
      Text("拖动滑块滑动")
        .fontSize(14)
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Pink)
    .borderRadius(10)
  }

  @Builder
  sliderView() {
    Column() {

    }.width("100%")
    .height("100%")
    .backgroundColor(Color.Red)
    .borderRadius({ topLeft: 10, bottomLeft: 10 })
  }

  @Builder
  thumbSlidingView() {
    Text("-->")
      .width("100%")
      .height("100%")
      .backgroundColor(Color.White)
      .textAlign(TextAlign.Center)
      .borderRadius({ topRight: 10, bottomRight: 10 })
      .border({ width: 1, color: "#e8e8e8" })
  }

  @Builder
  thumbCompleteView() {
    Column() {
      SymbolGlyph($r('sys.symbol.checkmark_circle_fill'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .renderingStrategy(SymbolRenderingStrategy.SINGLE)
        .fontColor([Color.Red])
    }
    .width("100%")
    .height("100%")
    .backgroundColor(Color.White)
    .justifyContent(FlexAlign.Center)
    .borderRadius({ topRight: 10, bottomRight: 10 })
    .border({ width: 1, color: "#e8e8e8" })
  }

  build() {
    Column() {
      SliderDragView({
        sliderControl: this.sliderControl,
        onComplete: () => {
          //滑动完成
          console.log("=======滑动完成")
        }
      })

      //全部自定义

      SliderDragView({
        sText: "拖动滑块滑动",
        sCompleteText: "完成验证",
        sliderControl: this.sliderControl2,
        defaultView: () => {
          //自定义默认视图
          this.defaultView()
        },
        sliderView: () => {
          //自定义滑动视图
          this.sliderView()
        },
        thumbSlidingView: () => {
          //自定义滑块滑动中视图
          this.thumbSlidingView()
        },
        thumbCompleteView: () => {
          //自定义滑块完成视图
          this.thumbCompleteView()
        },
        onComplete: () => {
          //滑动完成
          console.log("=======滑动完成")
        }
      }).margin({ top: 20 })

      Button("重置")
        .margin({ top: 20 })
        .onClick(() => {
          this.sliderControl.reset()
          this.sliderControl2.reset()
        })
    }
    .height('100%')
    .width('100%')
    .padding({ left: 20, right: 20 })
    .justifyContent(FlexAlign.Center)
  }
}