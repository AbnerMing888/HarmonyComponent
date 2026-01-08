## 介绍

rating是一个简单的星级评分组件，和系统的区别是，不用设置资源，纯组件绘制，只需传递颜色即可，支持五角星，矩形，爱心等多种效果。

## 支持Api版本

Api适用版本：>=12

## 目前功能

- 1、支持大小动态设置。
- 2、支持颜色动态修改。
- 3、支持数量动态修改。
- 4、支持小数步长设置。
- 5、支持爱心形状评分。
- 6、支持正方形、菱形、圆形、六边形效果。
- 7、支持点击和手势滑动评分。

## 效果

<p align="center">
<img src="https://loveharmony.oss-cn-beijing.aliyuncs.com/weight/rating/rating_001.png" width="330px" />
</p>

## 快速使用

方式一：在Terminal窗口中，执行如下命令安装三方包，DevEco Studio会自动在工程的oh-package.json5中自动添加三方包依赖。

**建议：在使用的模块路径下进行执行命令。**

```
ohpm install @abner/rating
```

方式二：在需要的模块中的oh-package.json5中设置三方包依赖，配置示例如下：

```
"dependencies": { "@abner/rating": "^1.0.0"}
```

## 代码使用

### 简单使用

```typescript
StarRating({
  onRatingChange: (star: number) => {
    this.starNumber = star
  }
})
```

### 设置默认数量

```typescript
 StarRating({
  ratingQuantity: 1
})
```

### 设置星星数量

```typescript
 StarRating({
  maxRating: 8
})
```

### 设置大小

```typescript
 StarRating({
  ratingSize: 28
})
```

### 设置颜色

```typescript
 StarRating({
  fillColor: Color.Red
})
```

### 设置边框

```typescript
StarRating({
  fillColor: Color.Red,
  strokeColor: Color.Blue,
  strokeWidth: 1,
  ratingSize: 25
})
```

### 未选中空心

```typescript
StarRating({
  emptyColor: Color.Transparent,
  strokeColor: Color.Gray,
  strokeWidth: 0.5,
  ratingSize: 25
})
```

### 设置小数

```typescript
 StarRating({
  ratingStep: 0.5,
  ratingSize: 25,
  onRatingChange: (star: number) => {
    this.starNumber2 = star
  }
})
```

### 正方形

```typescript
  StarRating({
  ratingType: RatingType.square
})
```

### 菱形

```typescript
 StarRating({
  ratingType: RatingType.diamond
})
```

### 六边形

```typescript
 StarRating({
  ratingType: RatingType.hexagon
})
```

### 圆形

```typescript
StarRating({
  ratingType: RatingType.circle,
  ratingStep: 0.5,
  ratingSize: 25,
})
```

### 爱心

```typescript
StarRating({
  ratingType: RatingType.love,
  fillColor: Color.Red,
  ratingSize: 25
})
```

## 属性介绍

常见属性配置如下：

| 属性             | 类型                                               | 概述                                                                    |
|----------------|--------------------------------------------------|-----------------------------------------------------------------------|
| maxRating      | number                                           | 最大数量                                                                  |
| ratingSize     | number                                           | 组件每个元素大小                                                              |
| ratingSpacing  | number                                           | 组件元素之间的间距                                                             |
| emptyColor     | string / number / CanvasGradient / CanvasPattern | 未选中时的空颜色                                                              |
| fillColor      | string / number / CanvasGradient / CanvasPattern | 选中之后的填充颜色                                                             |
| strokeColor    | string / number / CanvasGradient / CanvasPattern | 组件元素边框颜色                                                              |
| strokeWidth    | number                                           | 组件元素边框大小                                                              |
| ratingStep     | number                                           | 星星步长                                                                  |
| ratingQuantity | number                                           | 星星填充比例：0-1之间                                                          |
| onRatingChange | (num: number) => void                            | 评级回调                                                                  |
| ratingType     | RatingType                                       | 组件类型，pentagram：五角星,hexagon：六边形,circle：圆,diamond：菱形,square：正方形,love：爱心 |
| isGesture      | boolean                                          | 是否允许手势，默认false不允许                                                     |

## 问题反馈

如果您在使用上有问题，解决不了，或者查看精华的鸿蒙技术文章，可扫码进行操作。

<p><img src="https://vipandroid-image.oss-cn-beijing.aliyuncs.com/harmony/abner.jpg" width="150"></p>

## License

```
Copyright (C) AbnerMing, rating Open Source Project

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