import { NumberBox } from '@abner/number_box'
import { ActionBar } from '../view/ActionBar'
import { CustomContentDialog } from '@kit.ArkUI'
import { inputMethod } from '@kit.IMEKit';

@Extend(Text)
function textStyle() {
  .fontSize($r("app.float.text_14"))
  .fontColor($r("app.color.desc_color"))
}

/**
 *AUTHOR:AbnerMing
 *DATE:2026/1/5
 *INTRODUCE:数字加减框
 */
@Entry
@ComponentV2
struct NumberBoxPage {
  @Local inputText?: number
  @Local defaultNumber: number = 1
  @Local dialogInputText: string = ""
  private numberBoxArray: string[] = ["基本用法", "设置初始值", "禁止编辑",
    "加减号超出后禁止点击", "加减号禁止样式", "设置输入框圆角", "设置宽度", "设置样式",
    "设置步长：5", "输入框点击"] //数字加减菜单

  build() {
    Column() {
      ActionBar({ title: "数字加减框" })

      ForEach(this.numberBoxArray, (item: string, index: number) => {
        Row() {
          Text(item).textStyle()
          Blank()
          if (index == 0) { //基本用法
            NumberBox({
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          } else if (index == 1) { //设置初始值
            NumberBox({
              minNumber: 1, //最小值
              maxNumber: 10, //最大值
              defaultNumber: 2, //默认值
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          } else if (index == 2) { //禁止编辑
            NumberBox({
              inputEnabled: false, //输入框禁止编辑
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          } else if (index == 3) { //加减号超出后禁止点击
            NumberBox({
              minNumber: 1, //最小值
              maxNumber: 5, //最大值
              isAutoMinusPlusEnabled: true,
              controlAttribute: (attr) => {
                attr.plusMinusEnabledFontColor = Color.Gray //加减号禁止点击颜色
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          } else if (index == 4) { //加减号禁止样式
            NumberBox({
              minNumber: 1, //最小值
              maxNumber: 5, //最大值
              isAutoMinusPlusEnabled: true, //是否自动禁止
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              controlAttribute: (attr) => {
                attr.plusMinusEnabledFontColor = Color.Gray //加减号禁止点击颜色
                attr.width = 18
                attr.height = 18
                attr.border = { radius: 18 }
                attr.backgroundColor = "#ff968f8f"
                attr.plusMinusEnabledBgColor = "#ffcfcdcd" //禁止背景颜色
                attr.plusMinusEnabledBorder = { radius: 18 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          } else if (index == 5) { //设置输入框圆角
            NumberBox({
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          } else if (index == 6) { //设置宽度
            NumberBox({
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(150)
          } else if (index == 7) { //设置样式

            NumberBox({
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
                attr.fontColor = Color.White
                attr.backgroundColor = "#fff1b706"
                attr.padding = 5
              },
              controlAttribute: (attr) => {
                attr.width = 20
                attr.height = 20
                attr.fontColor = Color.White
                attr.border = { radius: 3 }
                attr.backgroundColor = "#fff1b706"
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)

          } else if (index == 8) { //设置步长：5

            NumberBox({
              step: 5,//设置步长
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)

          } else if (index == 9) { //输入框点击
            NumberBox({
              defaultNumber: this.defaultNumber,
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onInputClick: () => {
                inputMethod.getController().stopInputSession()
                this.dialogController.open()
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
          }
        }
        .width("100%")
        .height($r("app.float.view_50"))
        .backgroundColor(Color.White)
        .padding({ left: $r("app.float.view_20"), right: $r("app.float.view_20") })
        .margin({ top: $r("app.float.view_10") })
      })

      Row() {
        Text("获取输入值：" + this.inputText).textStyle()
        Blank()
        NumberBox({
          inputAttribute: (attr) => {
            attr.border = { radius: 5 }
          },
          onChange: (num) => {
            this.inputText = num
            console.log("===数量改变监听：" + num)
          }
        }).width(100)
      }
      .width("100%")
      .height(50)
      .margin({ top: 10 })
      .backgroundColor(Color.White)
      .padding({ left: $r("app.float.view_20"), right: $r("app.float.view_20") })

    }
    .height("100%")
    .width("100%")
    .backgroundColor($r("app.color.home_select_color"))
  }

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomContentDialog({
      primaryTitle: '输入数量',
      contentBuilder: () => {
        this.buildContent();
      },
      buttons: [
        {
          value: '取消',
          buttonStyle: ButtonStyleMode.TEXTUAL,
          action: () => {
            console.info('Callback when the button is clicked')
          }
        },
        {
          value: '确定',
          buttonStyle: ButtonStyleMode.TEXTUAL,
          role: ButtonRole.ERROR,
          action: () => {
            this.defaultNumber = Number.parseInt(this.dialogInputText)
          }
        }
      ],
    }),
  })

  // 自定义弹出框的内容区
  @Builder
  buildContent(): void {
    Column() {
      TextInput({ text: $$this.dialogInputText })
        .type(InputType.Number)
    }
    .width('100%')
  }
}