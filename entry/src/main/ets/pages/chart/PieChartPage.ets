import { PieChartControl, PieChartData, PieChartType, PieChartView } from '@abner/pie';
import { ActionBar } from '../../view/ActionBar';

/**
 *AUTHOR:AbnerMing
 *DATE:2026/1/12
 *INTRODUCE:饼状图
 */
@Entry
@ComponentV2
struct PieChartPage {
  @Local customPopup: boolean = false
  @Local title: string = "饼状图"
  pieChartControl: PieChartControl = new PieChartControl()
  private chartData: PieChartData[] = [
    { label: "类别A", value: 30, color: "#3498db" },
    { label: "类别B", value: 20, color: "#e74c3c" },
    { label: "类别C", value: 25, color: "#2ecc71" },
    { label: "类别D", value: 15, color: "#f39c12" },
    { label: "类别E", value: 10, color: "#9b59b6" }
  ];
  private titleArray: string[] =
    ["普通模式", "外部标注", "外部折线标注", "点击交互", "圆环", "圆环点击交互", "左侧标注", "顶部标注", "点击提示",
      "动画进入"]
  @Local clickPosition: number = 0
  @Local tempPieChartData?: PieChartData = undefined
  private tempPieChartTimeout: number = -1

  @Builder
  TextTag(text: string) {
    Text(text)
      .fontWeight(FontWeight.Bold)
      .fontColor(Color.Black)
      .fontSize(14)
      .margin({ top: 10 })
  }

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

        if (this.clickPosition == 0) {
          PieChartView({
            chartData: this.chartData,
            textColor: Color.White
          }).height(200)
        } else if (this.clickPosition == 1) {
          PieChartView({
            chartData: this.chartData,
            radius: 80, //饼状图半径
            chartType: PieChartType.external//外部标注
          }).height(220)
            .margin({ top: 10 })
        } else if (this.clickPosition == 2) {
          PieChartView({
            chartData: this.chartData,
            radius: 80, //饼状图半径
            chartType: PieChartType.polyline//外部折线标注
          }).height(220)
            .margin({ top: 10 })
        } else if (this.clickPosition == 3) {
          PieChartView({
            chartData: this.chartData,
            radius: 80, //饼状图半径
            chartType: PieChartType.clickInteraction//可点击交互
          }).height(220)
            .margin({ top: 10 })
        } else if (this.clickPosition == 4) {
          PieChartView({
            chartData: this.chartData,
            radius: 80, //饼状图半径
            chartType: PieChartType.ring//圆环
          }).height(220)
            .margin({ top: 10 })
        } else if (this.clickPosition == 5) {
          PieChartView({
            chartData: this.chartData,
            radius: 50, //饼状图半径
            chartType: PieChartType.ringClick//圆环点击交互
          }).height(220)
            .margin({ top: 10 })
        } else if (this.clickPosition == 6) {
          //左侧标注
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
        } else if (this.clickPosition == 7) {
          //顶部标注
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
        } else if (this.clickPosition == 8) {
          //点击提示
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
        } else if (this.clickPosition == 9) {
          PieChartView({
            chartData: this.chartData,
            radius: 80, //饼状图半径
            chartType: PieChartType.animation, //动画进入
            pieChartControl: this.pieChartControl,
            animateTime: 50
          }).height(220)
            .margin({ top: 10 })

          Row() {
            this.TextTag("动画进入")
            Button("重置")
              .onClick(() => {
                this.pieChartControl.resetUnfoldAnimate()
              })
          }
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