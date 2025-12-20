## 介绍

slider是一个支持简单便捷的滑块验证组件，无论背景还是滑块等样式，均可自定义实现。

## 支持Api版本

Api适用版本：>=12

## 目前功能

- 1、支持自定义组件，可按照自己要求实现滑块验证。
- 2、支持滑块验证状态重置功能。
- 3、支持滑块验证完成时回调。

## 效果

动态效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/slider/slider_001.gif" width="300px" />
</p>

静态效果，完全支持自定义组件样式。

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/slider/slider_002.png" width="300px" />
</p>


## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/slider
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/slider": "^1.0.0"}
```

## 代码使用

目前默认的是常规的绿色验证样式，如果符合需求，可以直接使用。

```typescript
 SliderDragView({
  onComplete: () => {
    //滑动完成
    console.log("=======滑动完成")
  }
})
```

### 自定义组件形式

目前支持所有的样式自定义，需要自己来逐一实现自己需要的UI。

```typescript
SliderDragView({
  sText: "拖动滑块滑动",
  sCompleteText: "完成验证",
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

```
### 完整案例

```typescript
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
```

### 相关属性


| 属性                | 类型                   | 概述                     |
|-------------------|----------------------|------------------------|
| sWidth            | Length               | 整体组件的宽度                |
| sHeight           | Length               | 整体组件的高度                |
| thumbWidth        | Length               | 滑块的宽度                  |
| thumbHeight       | Length               | 滑块的高度                  |
| defaultView       | @BuilderParam        | 自定义传递的默认视图             |
| sliderView        | @BuilderParam        | 自定义传递的拖动视图             |
| thumbSlidingView  | @BuilderParam        | 拖动的滑块-滑动中视图            |
| thumbCompleteView | @BuilderParam        | 拖动的滑块-滑动完成             |
| sDuration         | number               | 手指结束时的动画时间,默认100毫秒     |
| onComplete        | () => void           | 滑动完成状态回调               |
| sText             | string               | 提示内容， 默认为：按住滑块拖动       |
| sCompleteText     | string               | 滑动完成提示内容，默认为：完成验证      |
| sliderControl     | SliderControl        | 重置控制器，可还原滑动状态          |
| sliderAttribute   | SliderDragAttribute  | 默认滑动视图属性，如果自己定义组件，则不需要 |

#### SliderDragAttribute

滑动视图默认属性，如果是使用的自定义组件形式，此属性配置无效。


| 属性                | 类型                      | 概述      |
|-------------------|-------------------------|---------|
| defaultViewAttr   | DefaultViewAttribute    | 默认的视图属性 |
| sliderViewAttr    | SliderViewAttribute     | 滑动的视图属性 |
| completeTextAttr  | CompleteTextAttribute   | 完成文字属性  |
| thumbCompleteAttr | ThumbCompleteAttribute  | 滑块完成属性  |
| thumbSlidingAttr  | ThumbCompleteAttribute  | 滑块滑动属性  |


备注：所有的属性，都是基本的背景，颜色等配置，不在一一介绍。


## 咨询作者

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, slider Open Source Project

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```

