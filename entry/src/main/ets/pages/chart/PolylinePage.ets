import { AxisLabelsPosition, PolylineView } from '@abner/polyline'
import { ActionBar } from '../../view/ActionBar'

/**
 *AUTHOR:AbnerMing
 *DATE:2026/1/21
 *INTRODUCE:折线图
 */
@Entry
@ComponentV2
struct PolylinePage {
  @Local customPopup: boolean = false
  @Local title: string = "折线图"
  @Local clickPosition: number = 0
  private titleArray: string[] =
    ["普通折线图", "更改折线颜色", "X轴标签居中", "网格虚线框", "隐藏垂直线", "延长XY轴线",
      "多折线", "Y轴自定义", "点击事件", "十字光标"]
  private xLabels: string[] = ['一月', '二月', '三月', '四月', '五月', '六月']
  private yData: number[] = [-150, 20, 320, 160, 300, 200]
  @Local xClickLabel?: string = undefined
  @Local yClickData?: number = undefined
  private tempPieChartTimeout: number = -1

  build() {
    Column() {
      ActionBar({
        title: this.title, rightText: "切换", rightClick: () => {
          //点击切换
          this.customPopup = !this.customPopup;
        }
      })
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.TopRight,
          mask: { color: '#30000000' },
          popupColor: Color.White,
          enableArrow: true,
          radius: 10,
          // 设置气泡避让软键盘
          keyboardAvoidMode: KeyboardAvoidMode.DEFAULT,
          showInSubWindow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        })

      Column() {
        if (this.clickPosition == 0) { //普通折线图
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
          PolylineView({
            xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
            data: [-150, 20, 320, 160, 300, 200]
          }).width("100%")
            .height(300)
        } else if (this.clickPosition == 1) { //更改折线颜色
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
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
        } else if (this.clickPosition == 2) { //X轴标签居中
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
          PolylineView({
            xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
            data: [-150, 20, 320, 160, 300, 200],
            axisLabelsPosition: AxisLabelsPosition.between
          }).width("100%")
            .height(300)
        } else if (this.clickPosition == 3) { //网格虚线框
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
          PolylineView({
            xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
            data: [-150, 20, 320, 160, 300, 200],
            axisLabelsPosition: AxisLabelsPosition.between,
            onGridData: (grid) => {
              grid.isDottedLine = true //显示虚线
            }
          }).width("100%")
            .height(300)
        } else if (this.clickPosition == 4) { //隐藏垂直线
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
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
        } else if (this.clickPosition == 5) { //延长XY轴线
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
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
        } else if (this.clickPosition == 6) { //双折线

          Text("各部门计划完成情况")
            .TextStyle()

          Row() {
            Circle()
              .fill('#10b981')
              .size({ width: 10, height: 10 })
            Text("计划")
              .fontSize(14)

            Circle()
              .fill('#f97316')
              .size({ width: 10, height: 10 })
              .margin({ left: 10 })
            Text("实际")
              .fontSize(14)
          }.width("100%")
          .padding({ left: 30 })
          .margin({ bottom: 10 })

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
        } else if (this.clickPosition == 7) { //Y轴自定义
          Text("时时空气质量")
            .TextStyle()
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
        } else if (this.clickPosition == 8) { //点击事件
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
          Stack() {
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

            Column() {
              Text(this.xClickLabel)
                .fontSize(14)
                .fontColor(Color.White)
              Row() {
                Circle()
                  .size({ width: 10, height: 10 })
                  .fill("#3b82f6")
                Text("销售额 " + this.yClickData)
                  .fontSize(14)
                  .fontColor(Color.White)
                  .margin({ left: 10 })
              }
            }
            .backgroundColor("#80000000")
            .padding(10)
            .borderRadius(3)
            .justifyContent(FlexAlign.Start)
            .visibility(this.xClickLabel != undefined ? Visibility.Visible : Visibility.None)
          }

        } else if (this.clickPosition == 9) { //十字光标
          Text("2026年上半年月份商品营业额（单位：w）")
            .TextStyle()
          PolylineView({
            xLabels: ['一月', '二月', '三月', '四月', '五月', '六月'],
            data: [-150, 20, 320, 160, 300, 200],
            onCrossHairData: (hair) => {
              hair.show = true
              hair.color = "#ff0000" //十字光标颜色
            }
          }).width("100%")
            .height(300)
        }
      }.layoutWeight(1)
      .justifyContent(FlexAlign.Center)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  popupBuilder() {
    Column() {
      ForEach(this.titleArray, (item: string, index: number) => {
        Text(item)
          .width("100%")
          .height(50)
          .textAlign(TextAlign.Center)
          .border({ width: { bottom: 1 }, color: $r("app.color.home_select_color") })
          .onClick(() => {
            this.title = item
            this.clickPosition = index
            this.customPopup = !this.customPopup
          })
      })

    }.width(130)
  }
}

@Extend(Text)
function TextStyle() {
  .fontColor($r("app.color.title_color"))
  .fontSize($r("app.float.text_14"))
  .margin({ bottom: $r("app.float.view_10") })
  .fontWeight(FontWeight.Bold)
}