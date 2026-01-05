@Entry
@Component
struct ListPage {
  @State listData: number[] = []

  aboutToAppear(): void {
    for (let i = 0; i < 1000; i++) {
      this.listData.push(i)
    }
  }

  build() {
    Column() {
      List({ space: 20 }) {
        ForEach(this.listData, (item: number) => {
          ListItem() {
            Column() {
              Row() {
                Image("https://i-blog.csdnimg.cn/img_convert/9153f45b48c773c8450b05eda0d2e4a9.png")
                  .layoutWeight(1)
                  .height(50)
                  .border({ width: 5, color: Color.White })

                Image("https://i-blog.csdnimg.cn/img_convert/9153f45b48c773c8450b05eda0d2e4a9.png")
                  .layoutWeight(1)
                  .height(50)
                  .border({ width: 5, color: Color.White })

                Image("https://i-blog.csdnimg.cn/img_convert/9153f45b48c773c8450b05eda0d2e4a9.png")
                  .layoutWeight(1)
                  .height(50)
                  .border({ width: 5, color: Color.White })
                Image("https://i-blog.csdnimg.cn/img_convert/9153f45b48c773c8450b05eda0d2e4a9.png")
                  .layoutWeight(1)
                  .height(50)
                  .border({ width: 5, color: Color.White })

                Image("https://i-blog.csdnimg.cn/img_convert/9153f45b48c773c8450b05eda0d2e4a9.png")
                  .layoutWeight(1)
                  .height(50)
                  .border({ width: 5, color: Color.White })
              }

              Text("我是测试数据：" + item)
                .margin({ top: 10 })
                .fontColor(Color.Black)
                .fontWeight(FontWeight.Bold)

              Text("我是测试描述数据我是测试描述数据我是测试描述数据我是测试描述数据我是测试描述数据我是测试描述数据我是测试描述数据：" +
                item)
                .margin({ top: 10 })
            }
          }
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}