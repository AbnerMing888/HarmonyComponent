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