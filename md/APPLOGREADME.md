## 介绍

app_log是一个支持应用内和控制台双向日志查看的工具，使用简单，可视化操作，满足多种场景化需求，让查看日志变得直观简单。

## 支持Api版本

Api适用版本：>=12

## 主要特点

支持三种模式：1、单一控制台日志输出，2、单一应用内日志输出，3、控制台和应用内同时日志输出。

使用简单：应用内悬浮按钮形式，想拖动到哪就拖动到哪，查看日志时，轻触即达。

## 目前功能

- 1、支持应用内可视化查看日志。
- 2、支持控制台格式化查看日志。
- 3、支持应用内日志背景样式切换。
- 4、支持应用内悬浮按钮查看日志。
- 5、支持应用内半模态和全模态查看。
- 6、支持一键清空日志。
- 7、支持按颜色区分不同类型下的日志内容。

## 效果

### 应用端

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/log/log_001.png" width="180px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/log/log_002.png" width="180px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/log/log_003.png" width="180px" />
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/log/log_004.png" width="180px" />
</p>

### IDE控制台

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/log/log_005.jpg" width="300px" />
</p>


## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/app_log
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/app_log": "^1.0.1"}
```

## 代码使用

### 初始化

可在AbilityStage或者主入口时进行初始化，主要配置全局参数，初始化不是必须的！有需要可设置，不需要可不设置！

```typescript
AppLog.getAppLog().init({

})
```

属性配置


| 属性               | 类型            | 概述                                         |
|------------------|---------------|--------------------------------------------|
| logOutputType    | LogOutputType | 日志输出类型，默认LogOutputType.DEFAULT，控制台和应用内同时输出 |
| globalTag        | string        | 全局Tag，默认为HarmonyOSLog                      |
| isHiLog          | boolean       | 控制台输出类型，默认true，为hiLog形式，fasle为console      |
| closeLog         | boolean       | 日志输出开关，默认false为打开，可根据测试或正式进行动态设置           |
| showLogLocation  | boolean       | 控制台日志输出是否需要位置，默认true为需要                    |


### 应用内开启悬浮日志入口

可单页面设置，也可全局设置。

```typescript
AppLog.getAppLog().showLog(() => {
  //这里可配置页面返回，可以在关闭日志的同时，返回页面，根据自己需要进行配置。比如，我使用的是router
  this.getUIContext().getRouter().back()
})
```
### 应用内关闭悬浮日志入口

```typescript
AppLog.getAppLog().hideLog()
```

### 日志打印

支持数字，字符串，数组，对象，json等等类型数据打印，并且支持格式化形式输出。

打印普通的一条日志

```typescript
AppLog.log("我是一条普通的字符串")
```

各个类型输出

```typescript
AppLog.debug("我是debug信息")
AppLog.info("我是info信息")
AppLog.warn("我是warn信息")
AppLog.error("我是error信息")
AppLog.fatal("我是fatal信息")
```

各个数据输出

```typescript
//数字
AppLog.debug(888990008888, "testTag")
//数组  
AppLog.error(["条目一", "条目二", "条目三", "条目四"], "tag_001")
//对象  
let bean = new TestBean()
bean.name = "我是测试对象"
bean.age = 18
AppLog.error(bean)
//json串
let json = "{\"name\":\"程序员一鸣\",\"age\":18}"
AppLog.warn(json)
````


单独设置tag

```typescript
AppLog.debug("我是单独设置的tag", "testTag")
```



## 咨询作者

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, app_log Open Source Project

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

