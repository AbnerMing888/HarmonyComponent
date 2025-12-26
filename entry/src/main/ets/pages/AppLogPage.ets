import { AppLog } from '@abner/app_log';
import { App } from '../config/App';

@Entry
@Component
struct AppLogPage {
  aboutToAppear(): void {
    AppLog.getAppLog().showLog(() => {
      AppLog.getAppLog().hideLog()
      this.getUIContext().getRouter().back()
    })
  }

  build() {
    Column() {

      Button("打印普通字符串")
        .margin({ top: 10 })
        .onClick(() => {
          AppLog.log("我是一条普通的字符串")
        })
      Button("打印数字")
        .margin({ top: 10 })
        .onClick(() => {
          AppLog.debug(888990008888, "testTag")
        })
      Button("打印数组")
        .margin({ top: 10 })
        .onClick(() => {
          AppLog.error(["条目一", "条目二", "条目三", "条目四"], "tag_001")
        })
      Button("打印对象")
        .margin({ top: 10 })
        .onClick(() => {
          let bean = new TestBean()
          bean.name = "我是测试对象"
          bean.age = 18
          AppLog.error(bean)
        })
      Button("打印json")
        .margin({ top: 10 })
        .onClick(() => {
          let json = "{\"name\":\"程序员一鸣\",\"age\":18}"
          AppLog.warn(json)
        })

      Row() {
        Button("debug")
          .onClick(() => {
            AppLog.debug("我是debug信息")
          })
        Button("info")
          .margin({ left: 8 })
          .onClick(() => {
            AppLog.info("我是info信息")
          })
        Button("warn")
          .onClick(() => {
            AppLog.warn("我是warn信息")
          }).margin({ left: 8 })
        Button("error")
          .onClick(() => {
            AppLog.error("我是error信息")
          }).margin({ left: 8 })
        Button("fatal")
          .onClick(() => {
            AppLog.fatal("我是fatal信息")
          }).margin({ left: 8 })

      }.margin({ top: 10 })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}

class TestBean {
  name?: string
  age?: number
}