## 介绍

number_box是一个简单便捷的数字加减组件，支持步长设置，支持样式动态配置，适用于购物车等数量加减使用场景。

## 支持Api版本

Api适用版本：>=12

## 目前功能

- 1、支持样式自定义修改。
- 2、支持数量步长设置。

## 效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/number/number_001.png" width="330px" />
</p>

## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/number_box
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/number_box": "^1.0.0"}
```

## 代码使用

### 简单使用

```typescript
 NumberBox({
  onChange: (num) => {
    console.log("===数量改变监听：" + num)
  }
}).width(100)
```

### 设置初始值

```typescript
NumberBox({
  minNumber: 1, //最小值
  maxNumber: 10, //最大值
  defaultNumber: 2, //默认值
  onChange: (num) => {
    console.log("===数量改变监听：" + num)
  }
}).width(100)
```

### 禁止编辑

```typescript
NumberBox({
              inputEnabled: false, //输入框禁止编辑
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
```

### 加减号超出后禁止点击

```typescript
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
```

### 加减号禁止样式

```typescript
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
```

### 设置输入框圆角

```typescript
NumberBox({
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
```

### 设置宽度

```typescript
NumberBox({
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(150)
```

### 设置样式

```typescript
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
```

### 设置步长：5

```typescript
NumberBox({
              step: 5,//设置步长
              inputAttribute: (attr) => {
                attr.border = { radius: 5 }
              },
              onChange: (num) => {
                console.log("===数量改变监听：" + num)
              }
            }).width(100)
```

### 输入框点击

```typescript
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
```

### 获取输入值

```typescript
 NumberBox({
          inputAttribute: (attr) => {
            attr.border = { radius: 5 }
          },
          onChange: (num) => {
            this.inputText = num
            console.log("===数量改变监听：" + num)
          }
        }).width(100)
```

## 属性介绍

常见属性配置如下：

| 属性                     | 类型                                | 概述                            |
|------------------------|-----------------------------------|-------------------------------|
| maxNumber              | number                            | 最大数量                          |
| minNumber              | number                            | 最小数量，默认为1                     |
| defaultNumber          | number                            | 默认数量，默认为1                     |
| onChange               | (num: number) => void             | 数量改变回调                        |
| step                   | number                            | 步长，默认为1                       |
| minusEnabled           | boolean                           | 是否禁止减按钮，默认false不禁止            |
| plusEnabled            | boolean                           | 是否禁止加按钮 ，默认false不禁止           |
| inputEnabled           | boolean                           | 是否禁止输入框编辑 ，默认false不禁止         |
| isAutoMinusPlusEnabled | boolean                           | 加减号是否自动禁止,默认false不禁止          |
| onInputClick           | () => void                        | 输入框点击事件                       |
| onPlusExceed           | () => void                        | 点击+超过最大数量是否回调，默认为提示，设置后，自己做处理 |
| onMinusExceed          | () => void                        | 点击-小于最小数量是否回调，默认为提示，设置后，自己做处理 |
| inputAttribute         | (attr: InputAttribute) => void    | 输入框属性设置                       |
| controlAttribute       | (attr: ControlAttribute) => void  | 加减按钮属性设置                      |

### InputAttribute

输入框属性配置如下


| 属性                    | 类型                                  | 概述        |
|-----------------------|-------------------------------------|-----------|
| width                 | Length                              | 输入框宽      |
| height                | Length                              | 输入框高      |
| fontSize              | Length                              | 文字大小      |
| fontColor             | ResourceColor                       | 文字颜色      |
| fontWeight            | number / FontWeight / ResourceStr   | 文字字重      |
| fontStyle             | FontStyle                           | 文字样式      |
| fontFamily            | ResourceStr                         | 文字字体      |
| backgroundColor       | ResourceColor                       | 输入框背景     |
| marginLeft            | Length                              | 输入框距离左边   |
| marginRight           | Length                              | 输入框距离右边   |
| padding               | Padding / Length / LocalizedPadding | 输入框内边距    |
| maxLength             | number                              | 输入框最大输入长度 |
| placeholderColor      | ResourceColor                       | 提示文本颜色    |
| placeholderFontSize   | Length                              | 提示文本大小    |
| placeholderFontWeight | FontWeight / number / string        | 提示文本字重    |
| placeholderFontFamily | string / Resource                   | 提示文本字体    |
| placeholderFontStyle  | FontStyle                           | 提示文本样式    |
| border                | BorderOptions                       | 输入框边框属性集合 |

### ControlAttribute

加减按钮属性配置如下：

| 属性                        | 类型                              | 概述           |
|---------------------------|---------------------------------|--------------|
| width                     | Length                          | 按钮宽度         |
| height                    | Length                          | 按钮高度         |
| fontSize                  | number /string /Resource        | 按钮文字大小       |
| backgroundColor           | ResourceColor                   | 按钮背景颜色       |
| fontColor                 | ResourceColor                   | 按钮文字颜色       |
| fontWeight                | number / FontWeight    / string | 按钮字重         |
| border                    | BorderOptions                   | 按钮边框属性集合     |
| plusMinusEnabledFontColor | ResourceColor                   | 加减号禁止点击颜色    |
| plusMinusEnabledBgColor   | ResourceColor                   | 加减号禁止背景颜色    |
| plusMinusEnabledBorder    | BorderOptions                   | 加减号禁止边框属性集合  |

## 问题反馈

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, number_box Open Source Project

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