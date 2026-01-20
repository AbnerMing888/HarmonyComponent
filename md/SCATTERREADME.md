## 介绍

scatter是一个简单的散点图组件，只需要简单的配置，便可以实现一个散点图，支持单一和多样颜色配置，支持所有属性自定义实现。

## 支持Api版本

Api适用版本：>=12

## 目前功能

- 1、支持单一颜色配置和多种颜色配置。
- 2、支持自绘制方格和不带方格两种效果。
- 3、支持数据动态调整。
- 4、所有属性均可自定义实现。

## 静态效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/scatter/scatter.png" width="350px"/>
</p>

## 动态效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/scatter/scatter.gif" width="350px" />
</p>

## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/scatter
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/scatter": "^1.0.0"}
```

## 代码使用


### 简单使用

```typescript
 ScatterChartView({
  scatterChartData: this.scatterChartData
})
  .width("100%")
  .height(300)
```

### 带网格

```typescript
ScatterChartView({
  scatterChartData: this.scatterChartData,
  chartType: ScatterChartType.grid
})
  .width("100%")
  .height(300)
```

### 完整Demo

```typescript

import { ScatterChartData, ScatterChartType, ScatterChartView } from '@abner/scatter'
import { ActionBar } from '../../view/ActionBar'

/**
 *AUTHOR:AbnerMing
 *DATE:2026/1/17
 *INTRODUCE:散点图
 */
@Entry
@ComponentV2
struct ScatterChartPage {
  private colorArray: string[] = [
    '#3b82f6', '#ef4444', '#10b981', '#f59e0b',
    '#8b5cf6', '#06b6d4', '#6b7280', '#111827'
  ];
  private singleColor: string = '#3b82f6';
  @Local useMultiColor: boolean = true
  @Local scatterChartData: ScatterChartData[] = []

  aboutToAppear(): void {
    this.generateRandomPoints(10)
  }

  build() {
    Column() {
      ActionBar({ title: "散点图" })
      ScatterChartView({
        scatterChartData: this.scatterChartData
      })
        .width("100%")
        .height(300)

      ScatterChartView({
        scatterChartData: this.scatterChartData,
        chartType: ScatterChartType.grid
      })
        .width("100%")
        .height(300)

      Row() {
        Button("随机数据")
          .onClick(() => {
            this.generateRandomPoints(10)
          })
        Button("单色")
          .onClick(() => {
            this.useMultiColor = false
            this.generateRandomPoints(10)
          })
          .margin({ left: 10 })
        Button("多色")
          .margin({ left: 10 })
          .onClick(() => {
            this.useMultiColor = true
            this.generateRandomPoints(10)
          })
      }.margin({ top: 10 })
    }.width("100%")
      .height("100%")
  }

  // 生成随机数据点
  private generateRandomPoints(count: number) {
    this.scatterChartData = [];
    for (let i = 0; i < count; i++) {
      this.addRandomPoint();
    }
  }

  // 添加单个随机数据点
  private addRandomPoint() {
    const x = Math.random() * (100 - 0);
    const y = Math.random() * (100 - 0);
    const color =
      this.useMultiColor ? this.colorArray[Math.floor(Math.random() * this.colorArray.length)] : this.singleColor;
    this.scatterChartData.push({
      x: parseFloat(x.toFixed(2)),
      y: parseFloat(y.toFixed(2)),
      color: color
    })


  }
}
```


## 属性介绍

常见属性配置如下：

| 属性                 | 类型                                            | 概述                                    |
|--------------------|-----------------------------------------------|---------------------------------------|
| chartType          | ScatterChartType                              | 散点图类型，默认：ScatterChartType.default，无网格 |
| minX               | number                                        | x轴最小坐标,默认为0                           |
| maxX               | number                                        | x轴最大坐标 ,默认为100                        |
| stepX              | number                                        | x轴步长，默认20                             |
| minY               | number                                        | y轴最小坐标  ,默认为0                         |
| maxY               | number                                        | y轴最大坐标  ,默认为100                       |
| stepY              | number                                        | y轴步长   ，默认20                          |
| marginLeft         | number                                        | 距离左边，默认50                             |
| marginRight        | number                                        | 距离右边，默认30                             |
| marginTop          | number                                        | 距离上边，默认30                             |
| marginBottom       | number                                        | 距离下边，默认50                             |
| scatterChartData   | ScatterChartData                              | 散点图数据                                 |
| scatterSize        | number                                        | 散点图大小，默认3                             |
| scaleTextSize      | number                                        | XY轴的刻度值大小                             |
| scaleTextColor     | string/ number/ CanvasGradient/ CanvasPattern | XY轴的刻度颜色                              |
| scaleLineColor     | string/ number/ CanvasGradient/ CanvasPattern | 刻度线颜色                                 |
| scaleLineWidth     | number                                        | 刻度线粗细                                 |
| isShowXLabel       | boolean                                       | 是否显示X轴标签，默认fasle不显示                   |
| isShowYLabel       | boolean                                       | 是否显示Y轴标签，默认fasle不显示                   |
| labelTextX         | string                                        | X轴标签                                  |
| labelTextY         | string                                        | Y轴标签                                  |
| labelTextSize      | number                                        | 标签文字大小，默认14                           |
| labelTextColor     | string/ number/ CanvasGradient/ CanvasPattern | 标签文字颜色                                |
| scatterXYLineColor | string/ number/ CanvasGradient/ CanvasPattern | XY轴颜色                                 |
| scatterXYLineWidth | number                                        | XY轴宽度，默认1                             |
| gridBgColor        | string/ number/ CanvasGradient/ CanvasPattern | 网格背景                                  |
| gridLineColor      | string/ number/ CanvasGradient/ CanvasPattern | 网格线颜色                                 |
| gridLineWidth      | number                                        | 网格线粗细                                 |
| gridStrokeColor    | string/ number/ CanvasGradient/ CanvasPattern | 网格边框颜色                                |
| gridStrokeWidth    | number                                        | 网格线边框粗细                               |


## 问题反馈

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, scatter Open Source Project

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