import { RatingType, StarRating } from '@abner/rating'
import { ActionBar } from '../view/ActionBar'

/**
 *AUTHOR:AbnerMing
 *DATE:2026/1/7
 *INTRODUCE:星级评分条
 */
@Entry
@ComponentV2
struct StarRatingPage {
  @Local starNumber: number = 0
  @Local starNumber2: number = 0

  build() {
    Column() {
      ActionBar({ title: "星级评分组件" })
      Row() {
        Text("基本用法：" + this.starNumber)
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          onRatingChange: (star: number) => {
            this.starNumber = star
          }
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)

      Row() {
        Text("设置默认数量")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingQuantity: 1
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("设置星星数量")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          maxRating: 8
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("设置大小")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingSize: 28
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("设置颜色")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          fillColor: Color.Red
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("设置边框")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          fillColor: Color.Red,
          strokeColor: Color.Blue,
          strokeWidth: 1,
          ratingSize: 25
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("未选中空心")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          emptyColor: Color.Transparent,
          strokeColor: Color.Gray,
          strokeWidth: 0.5,
          ratingSize: 25
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("设置小数：" + this.starNumber2)
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingStep: 0.5,
          ratingSize: 25,
          onRatingChange: (star: number) => {
            this.starNumber2 = star
          }
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("正方形")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingType: RatingType.square
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("菱形")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingType: RatingType.diamond
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("六边形")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingType: RatingType.hexagon
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("圆形")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingType: RatingType.circle,
          ratingStep: 0.5,
          ratingSize: 25,
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })

      Row() {
        Text("爱心")
          .fontColor($r("app.color.title_color"))
          .fontSize($r("app.float.text_14"))
        Blank()
        StarRating({
          ratingType: RatingType.love,
          fillColor: Color.Red,
          ratingSize: 25
        })
      }
      .width("100%")
      .height(40)
      .padding({ left: 20, right: 20 })
      .backgroundColor(Color.White)
      .margin({ top: 10 })
    }.width("100%")
    .height("100%")
    .backgroundColor($r("app.color.home_select_color"))
  }
}