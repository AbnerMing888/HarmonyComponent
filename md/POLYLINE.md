## 介绍

polyline是一个简单的折线图组件，只为折线图服务！支持单折线，多折线展示，支持多种效果，支持点击，手势十字光标展示。

## 支持Api版本

Api适用版本：>=12

## 目前功能

- 1、支持普通的折线图展示。
- 2、支持多条折线对比展示。
- 3、支持折线背景网格多样式设置。
- 4、支持横线纵线虚线属性控制。
- 5、支持数据X轴居中展示。
- 6、支持点击事件。
- 7、支持X轴自定义标注。
- 8、支持刻度自定义展示。
- 9、支持手势十字光标展示。

## 效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/polyline/polyline_001.png" />
</p>
<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/polyline/polyline_002.png" />
</p>
<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/polyline/polyline.png" />
</p>

## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/polyline
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/polyline": "^1.0.0"}
```

## 代码使用

### 简单使用

```typescript
PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200]
}).width("100%")
  .height(300)
```

### 更改折线颜色

```typescript
PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200],
  onLineData: (line) => {
    line.color = Color.Red
  },
  onPointData: (point) => {
    point.fillColor = Color.Red
  }
}).width("100%")
  .height(300)
```

### X轴标签居中

```typescript
 PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200],
  axisLabelsPosition: AxisLabelsPosition.between
}).width("100%")
  .height(300)
```

### 网格虚线框

```typescript
 PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200],
  axisLabelsPosition: AxisLabelsPosition.between,
  onGridData: (grid) => {
    grid.isDottedLine = true //显示虚线
  }
}).width("100%")
  .height(300)
```

### 隐藏垂直线

```typescript
 PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200],
  axisLabelsPosition: AxisLabelsPosition.between,
  onGridData: (grid) => {
    grid.isDottedLine = true //显示虚线
    grid.showVerticalLine = false
  }
}).width("100%")
  .height(300)
```

### 延长XY轴线

```typescript
 PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200],
  axisLabelsPosition: AxisLabelsPosition.between,
  onGridData: (grid) => {
    grid.isDottedLine = true //显示虚线
    grid.showVerticalLine = false
  },
  marginTop: 20,
  onAxisLineData: (axis) => {
    axis.yExceedsSize = 20 //延长Y轴
  }
}).width("100%")
  .height(300)
```

### 双折线

```typescript
PolylineView({
  xLabels: ['管理部', '销售部', '采购部', '生产部', '财务部'],
  axisLabelsPosition: AxisLabelsPosition.between,
  includeZero: true, //显示0刻度
  multipleData: [
    {
      name: '计划',
      data: [35, 45, 42, 50, 38],
      fillColor: '#10b981',
      lineColor: '#10b981'
    },
    {
      name: '实际',
      data: [25, 38, 28, 48, 35],
      fillColor: '#f97316',
      lineColor: '#f97316'
    }
  ]
})
  .width("100%")
  .height(300)
```

### Y轴自定义

```typescript
PolylineView({
  minY: 0, //最小
  maxY: 5, //最大
  xLabels: ['1:00', '2:00', '3:00', '4:00', '5:00'],
  axisLabelsPosition: AxisLabelsPosition.between,
  data: [1.2, 1.8, 2.6, 3.6, 4.2], //数据
  onYLabelData: (label) => {
    label.yAxisLabels = ['', '优', '良', '轻', '中', '重']
    label.yAxisColor = ['', '#0ef106', '#cef106', '#f1b706', '#e76108', '#ff0000']
  },
  onLineData: (line) => {
    line.color = "#d95011"
  },
  onPointData: (point) => {
    point.fillColor = "#d95011"
  },
  onGridData: (grid) => {
    grid.isDottedLine = true //显示虚线
    grid.showVerticalLine = false
  },
  onCoordinateScaleData: (scale) => {
    scale.show = true
    scale.showYLine = false //隐藏Y轴刻度
    scale.showXLine = true //显示X轴刻度
    scale.hideXFirst = true //隐藏X轴第一个刻度
  }
}).width("100%")
  .height(300)
```

### 点击事件

```typescript
PolylineView({
  xLabels: this.xLabels,
  data: this.yData,
  onClickPointEvent: (bean) => {
    this.xClickLabel = this.xLabels[bean.position!!]
    this.yClickData = this.yData[bean.position!!]
    clearTimeout(this.tempPieChartTimeout)
    this.tempPieChartTimeout = setTimeout(() => {
      this.xClickLabel = undefined
    }, 2000)
  }
}).width("100%")
  .height(300)
```

### 十字光标

```typescript
PolylineView({
  xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
  data: [-150, 20, 320, 160, 300, 200],
  onCrossHairData: (hair) => {
    hair.show = true
    hair.color = "#ff0000" //十字光标颜色
  }
}).width("100%")
  .height(300)
```

## 属性介绍

常见属性配置如下：

| 属性                    | 类型                                             | 概述                                           |
|-----------------------|------------------------------------------------|----------------------------------------------|
| marginLeft            | number                                         | 距离左边，默认40                                    |
| marginRight           | number                                         | 距离右边，默认20                                    |
| marginTop             | number                                         | 距离上边，默认10                                    |
| marginBottom          | number                                         | 距离下边，默认30                                    |
| xLabels               | string[]                                       | X轴的数据                                        |
| data                  | number[]                                       | y轴的数据,单折线数据                                  |
| multipleData          | MultipleData[]                                 | y轴的数据,多折线数据                                  |
| includeZero           | boolean                                        | Y轴刻度是否从0开始                                   |
| axisLabelsPosition    | AxisLabelsPosition                             | 折线和X轴数据位置，默认AxisLabelsPosition.scale，以刻度位置展示 |
| onCoordinateScaleData | (coordinateScale: CoordinateScaleData) => void | 设置刻度样式                                       |
| onGridData            | (gridData: GridData) => void                   | 设置网格样式                                       |
| onAxisLineData        | (axisLineData: AxisLineData) => void           | 设置坐标轴样式                                      |
| onXLabelData          | (xLabelData: XLabelData) => void               | 设置X轴标签样式                                     |
| onYLabelData          | (yLabelData: YLabelData) => void               | 设置Y轴标签样式                                     |
| onPointData           | (pointData: PointData) => void                 | 设置交汇点样式                                      |
| onLineData            | (lineData: LineData) => void                   | 设置折线样式                                       |
| onCrossHairData       | (crossHairData: CrossHairData) => void         | 设置十字光标样式                                     |
| onClickPointEvent     | (data: PolylineItemData) => void               | 点击交汇点事件                                      |
| minY                  | number                                         | Y轴最小，自定义Y轴标签时可配置                             |
| maxY                  | number                                         | Y轴最大，自定义Y轴标签时可配置                             |

### AxisLabelsPosition

折线和X轴标签位置

```typescript
between: 折线和X轴坐标在中间
scale: 折线和X轴坐标在坐标轴
```

### CoordinateScaleData

设置刻度样式

| 属性          | 类型                                         | 概述                     |
|-------------|--------------------------------------------|------------------------|
| show        | boolean                                    | 是否显示刻度，默认true,显示       |
| color       | string/number/CanvasGradient/CanvasPattern | 刻度值颜色                  |
| length      | number                                     | 刻度值长度                  |
| width       | number                                     | 刻度值线大小                 |
| showXLine   | boolean                                    | 是否显示X轴刻度，默认true显示      |
| showYLine   | boolean                                    | 是否显示Y轴刻度，默认true显示      |
| hideXFirst  | boolean                                    | X轴第一个是否隐藏,默认false不隐藏   |
| hideYFirst  | boolean                                    | Y轴第一个是否隐藏 ,默认false不隐藏  |


### GridData

设置网格样式


| 属性                  | 类型                                         | 概述                |
|---------------------|--------------------------------------------|-------------------|
| show                | boolean                                    | 是否显示网格，默认true,显示  |
| color               | string/number/CanvasGradient/CanvasPattern | 网格颜色              |
| width               | number                                     | 网格线大小             |
| isDottedLine        | boolean                                    | 是否是虚线，默认false不是   |
| lineDash            | number[]                                   | 虚线间隔              |
| showVerticalLine    | boolean                                    | 是否显示垂直线 ，默认true显示 |
| showHorizontalLine  | boolean                                    | 是否显示水平线 ，默认true显示 |

### AxisLineData

设置坐标轴样式

| 属性            | 类型                                         | 概述                |
|---------------|--------------------------------------------|-------------------|
| show          | boolean                                    | 是否显示坐标轴，默认true,显示 |
| color         | string/number/CanvasGradient/CanvasPattern | 坐标轴颜色             |
| width         | number                                     | 坐标轴线大小            |
| xExceedsSize  | number                                     | X轴超出，根据自己需要设置     |
| yExceedsSize  | number                                     | Y轴超出，根据自己需要设置     |


### XLabelData

设置X轴标签样式

| 属性          | 类型                                         | 概述                 |
|-------------|--------------------------------------------|--------------------|
| show        | boolean                                    | 是否显示X轴标签，默认true,显示 |
| color       | string/number/CanvasGradient/CanvasPattern | X轴标签颜色             |
| fontSize    | number                                     | X轴标签文字大小           |
| fontWeight  | FontWeight                                 | X轴标签文字字重           |


### YLabelData

设置X轴标签样式

| 属性          | 类型                                                 | 概述                 |
|-------------|----------------------------------------------------|--------------------|
| show        | boolean                                            | 是否显示Y轴标签，默认true,显示 |
| color       | string/number/CanvasGradient/CanvasPattern         | Y轴标签颜色             |
| fontSize    | number                                             | Y轴标签文字大小           |
| fontWeight  | FontWeight                                         | Y轴标签文字字重           |
| yAxisLabels | string[]                                           | Y轴自定义标签            |
| yAxisColor  | string[]/number[]/CanvasGradient[]/CanvasPattern[] | Y轴自定义标签颜色          |

### PointData

设置交汇点样式

| 属性          | 类型                                         | 概述                |
|-------------|--------------------------------------------|-------------------|
| show        | boolean                                    | 是否显示交汇点，默认true,显示 |
| fillColor   | string/number/CanvasGradient/CanvasPattern | 交汇点填充颜色           |
| strokeColor | string/number/CanvasGradient/CanvasPattern | 交汇点边框颜色           |
| width       | number                                     | 交汇点大小             |
| fill        | boolean                                    | 是否是填充，默认是         |

### LineData

折线样式

| 属性     | 类型                                         | 概述               |
|--------|--------------------------------------------|------------------|
| show   | boolean                                    | 是否显示折线，默认true,显示 |
| color  | string/number/CanvasGradient/CanvasPattern | 折线颜色             |
| width  | number                                     | 折线大小             |

### CrossHairData

十字光标样式

| 属性              | 类型                                         | 概述                   |
|-----------------|--------------------------------------------|----------------------|
| show            | boolean                                    | 是否显示十字光标，默认false,不显示 |
| color           | string/number/CanvasGradient/CanvasPattern | 十字光标颜色               |
| width           | number                                     | 十字光标大小               |
| isDottedLine    | boolean                                    | 是否是虚线，默认false不是      |
| dash            | number[]                                   | 虚线间隔                 |
| movePointEvent  | (data: PolylineItemData) => void           | 十字光标移动点位             |

### PolylineItemData

点击和手势对象

```typescript
position:当前位置索引
parentIndex：父索引位置
```

## 问题反馈

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, polyline Open Source Project

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