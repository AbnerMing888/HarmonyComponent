## 介绍

pie是一个简单的饼状图表组件，只为饼状图服务！只需要简单的配置，便可以实现实现一个饼状图，支持内外标注，圆环，点击，动画等效果。

## 支持Api版本

Api适用版本：>=12

## 目前功能

- 1、支持普通的饼状图表展示。
- 2、支持饼状图点击。
- 3、支持饼状图圆环形式。
- 4、支持外部折线标注。
- 5、支持动画形式进入。

## 静态效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/pie/pie_static.png" />
</p>

## 配置属性后的动态效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/pie/pie_01.gif" width="280px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/pie/pie_02.gif" width="280px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/pie/pie_03.gif" width="280px" />
</p>

## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/pie
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/pie": "^1.0.0"}
```

## 代码使用

准备好数据

```typescript
 private chartData: PieChartData[] = [
    { label: "类别A", value: 30, color: "#3498db" },
    { label: "类别B", value: 20, color: "#e74c3c" },
    { label: "类别C", value: 25, color: "#2ecc71" },
    { label: "类别D", value: 15, color: "#f39c12" },
    { label: "类别E", value: 10, color: "#9b59b6" }
  ];
```

### 简单使用

```typescript
 PieChartView({
  chartData: this.chartData,
  textColor: Color.White
}).height(200)
```

### 外部标注

```typescript
 PieChartView({
  chartData: this.chartData,
  radius: 80, //饼状图半径
  chartType: PieChartType.external//外部标注
}).height(220)
```

### 外部折线标注

```typescript
 PieChartView({
  chartData: this.chartData,
  radius: 80, //饼状图半径
  chartType: PieChartType.polyline//外部折线标注
}).height(220)
```

### 点击交互

```typescript
 PieChartView({
  chartData: this.chartData,
  radius: 80, //饼状图半径
  chartType: PieChartType.clickInteraction//可点击交互
}).height(220)
```

### 圆环设置

```typescript
 PieChartView({
  chartData: this.chartData,
  radius: 80, //饼状图半径
  chartType: PieChartType.ring//圆环
}).height(220)
```

### 圆环点击交互

```typescript
 PieChartView({
  chartData: this.chartData,
  radius: 50, //饼状图半径
  chartType: PieChartType.ringClick//圆环点击交互
}).height(220)
```

### 左侧标注

```typescript
Row() {
  Column() {
    ForEach(this.chartData, (item: PieChartData) => {
      Row() {
        Circle()
          .width(10)
          .height(10)
          .fill("" + item.color)
          .borderRadius(10)
        Text(item.label)
          .margin({ left: 5 })
          .fontColor($r("app.color.title_color"))
      }.margin({ bottom: 5 })
    })
  }.margin({ right: 10 })

  PieChartView({
    chartData: this.chartData,
    textColor: Color.White
  }).height(200)
    .width(200)
}
```

### 顶部标注

```typescript
Column() {
  Row() {
    ForEach(this.chartData, (item: PieChartData) => {
      Row() {
        Circle()
          .width(10)
          .height(10)
          .fill("" + item.color)
          .borderRadius(10)
        Text(item.label)
          .margin({ left: 5 })
          .fontColor($r("app.color.title_color"))
      }.margin({ right: 5 })
    })
  }.margin({ bottom: 10 })

  PieChartView({
    chartData: this.chartData,
    textColor: Color.White
  }).height(200)
    .width(200)
}
```

### 点击提示

```typescript
Column() {
  Row() {
    ForEach(this.chartData, (item: PieChartData) => {
      Row() {
        Circle()
          .width(10)
          .height(10)
          .fill("" + item.color)
          .borderRadius(10)
        Text(item.label)
          .margin({ left: 5 })
          .fontColor($r("app.color.title_color"))
      }.margin({ right: 5 })
    })
  }.margin({ bottom: 10 })

  Stack() {
    PieChartView({
      chartData: this.chartData,
      textColor: Color.White,
      isAllowClick: true,
      onItemClick: (position) => {
        this.tempPieChartData = this.chartData[position]
        clearTimeout(this.tempPieChartTimeout)
        this.tempPieChartTimeout = setTimeout(() => {
          this.tempPieChartData = undefined
        }, 2000)
      }
    }).height(200)
      .width(200)

    Row() {
      Circle()
        .width(10)
        .height(10)
        .fill("" + this.tempPieChartData?.color)
        .borderRadius(10)
      Text(this.tempPieChartData?.label)
        .margin({ left: 5 })
        .fontColor(Color.White)
    }.backgroundColor("#80000000")
      .padding(10)
      .borderRadius(3)
      .visibility(this.tempPieChartData != undefined ? Visibility.Visible : Visibility.None)
  }
}
```

### 动画进入

```typescript
PieChartView({
  chartData: this.chartData,
  radius: 80, //饼状图半径
  chartType: PieChartType.animation, //动画进入
  pieChartControl: this.pieChartControl,
  animateTime: 50
}).height(220)
  .margin({ top: 10 })
```


## 属性介绍

常见属性配置如下：

| 属性                         | 类型                                         | 概述                |
|----------------------------|--------------------------------------------|-------------------|
| chartData                  | PieChartData                               | 饼状图数据源            |
| strokeStyle                | string/number/CanvasGradient/CanvasPattern | 扇形边框颜色,默认白色       |
| strokeWidth                | number                                     | 扇形边框大小            |
| textColor                  | string/number/CanvasGradient/CanvasPattern | 文本颜色，默认黑色         |
| textAlign                  | CanvasTextAlign                            | 文本横向对齐方式，默认center |
| textBaseline               | CanvasTextBaseline                         | 文本纵向对齐方式，默认middle |
| textSize                   | number                                     | 文本大小              |
| radius                     | number                                     | 饼状图半径             |
| chartType                  | PieChartType                               | 饼状图展示类型           |
| externalLineColor          | string/number/CanvasGradient/CanvasPattern | 外部折线颜色            |
| externalLineWidth          | number                                     | 外部折线大小            |
| externalLineRadius         | number                                     | 外部折线半径大小          |
| externalLineLeftTextAlign  | CanvasTextAlign                            | 外部折线文本左半边对齐方式     |
| externalLineRightTextAlign | CanvasTextAlign                            | 外部折线文本右半边对齐方式     |
| polylineColor              | string/number/CanvasGradient/CanvasPattern | 外部双折线折线颜色         |
| polylineWidth              | number                                     | 外部双折线大小           |
| polylineRadius             | number                                     | 外部双折线半径大小         |
| polylineDoubleRadius       | number                                     | 外部第二条线半径大小        |
| maxAnimationProgress       | number                                     | 最大放大，默认为1         |
| ringLineColor              | string/number/CanvasGradient/CanvasPattern | 圆环线颜色             |
| ringLineWidth              | number                                     | 圆环线大小             |
| ringWidth                  | number                                     | 圆环宽度              |
| ringLineRadius             | number                                     | 圆环线半径大小           |
| ringLineLeftTextAlign      | CanvasTextAlign                            | 外部折线文本左半边对齐方式     |
| ringLineRightTextAlign     | CanvasTextAlign                            | 外部折线文本右半边对齐方式     |
| animateTime                | number                                     | 展开动画时间，默认10毫秒     |
| pieChartControl            | PieChartControl                            | 饼状图控制器，可以控制动画重新展开 |
| onItemClick                | (position: number) => void                 | 块状点击回调            |
| isAllowClick               | boolean                                    | 是否允许点击            |

### PieChartData

| 属性     | 类型                                          | 概述     |
|--------|---------------------------------------------|--------|
| label  | string                                      | 饼状图数据源 |
| value  | number                                      | 饼状百分比  |
| color  | string/number/CanvasGradient/CanvasPattern  | 饼状图颜色  |


## 问题反馈

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, pie Open Source Project

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