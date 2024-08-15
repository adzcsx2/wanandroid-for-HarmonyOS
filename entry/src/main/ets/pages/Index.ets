import { requestData, requestData2 } from '../viewmodel/IndexViewModel';

@Observed
class MyNumber {
  n = 2

  constructor(a: number) {
    this.n = a
  }
}


class Number2 {
  n = 2

  constructor(a: number) {
    this.n = a
  }
}


@Entry
@Component
struct Index {
  onPageShow(): void {
    this.data = requestData()
    this.data = requestData2()

  }

  aboutToAppear(): void {
    setTimeout(() => {
      this.mNumber2 = new Number2(55)
    }, 5000)
  }

  @State message: string = 'Hello World2';
  @State fontSize: number = 20
  @State isShow: boolean = true
  @Provide newName: string = "ddddd"
  @State myNumber: MyNumber = new MyNumber(1)
  @Provide data: number = 0
  @State mNumber2: Number2 = new Number2(3)
  @State number3: number = 3
  @State data2: number = 2

  build() {
    Column({ space: "5lpx" }) {
      Text("123.123.123321.3213123.3123123.333333123123.123123".split("").join("\u200B"))
        .id("money")
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Clip })
        .fontSize(this.fontSize)
        .width("100%")
        .height(40)
        .onClick(() => {
          this.message = "newName"
        })
        .textCase(TextCase.Normal)

      Button($r("app.string.click"))
        .onClick(() => {
          this.fontSize += 4
        })
        .borderStyle(BorderStyle.Dashed)
        .backgroundColor(Color.Green)
        .backgroundImagePosition({ x: '0', y: 0 })
        .padding({
          top: '20.00vp',
          right: '16.00vp',
          bottom: '0.00vp',
          left: '18.00vp'
        })
        .margin({
          top: '20.00vp',
          right: '0.00vp',
          bottom: '0.00vp',
          left: '0.00vp'
        })
        .buttonStyle(ButtonStyleMode.NORMAL)
        .align(Alignment.Center)
        .alignSelf(ItemAlign.Start)

      Divider().margin(20)

      Column({ space: 5 }) {
        Column().width("100%").height(15).backgroundColor(Color.Green)
        Column().width("50%").height(15).backgroundColor(Color.Green)
      }.width("100%").height(100).backgroundColor(Color.Red)
      .alignItems(HorizontalAlign.Start)

      Row({ space: 5 }) {
        Row().layoutWeight(1).height(10).backgroundColor(Color.Black)
        Row().layoutWeight(1).height(10).backgroundColor(Color.Black)
        Row().layoutWeight(1).height(10).backgroundColor(Color.Black)
      }
      .width("375lpx")
      .height(30)
      .margin(5)
      .backgroundColor(Color.Red)
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.Center)

      MyCustomComponent({ myNumber: this.myNumber, mNumber2: this.mNumber2, number4: this.number3 })
        .width("100%")
        .id("my")
        .onClick(() => {
          this.newName = "阿杜"
        })
      MyCustomComponent2({ myNumber: this.myNumber, mNumber2: this.mNumber2, number4: this.number3 })

      Text("牛号" + this.newName)
        .width(100)

      Divider()
      Button("删除MyCustomComponent").width("375lpx").fontSize("20lpx")
        .id("button")
        .onClick(() => {
          console.info("dddd")
          this.newName = "哈哈"
          this.myNumber = new MyNumber(666)
          this.mNumber2.n = 123
          this.number3 = 5321
          this.data = 100
        })

      comp3()

      Navigation() {
        Text("aaa" + this.mNumber2.n + "," + this.number3 + "\t data : " + this.data)
        Text("data:" + this.data)
        Text("data2:" + this.data2)
      }
      .menus([{
        value: "aaa", action: () => {
          console.info("aaa")
        }

      }, {
        value: "bbb", action: () => {
          console.info("bbb")
        }
      }
      ])
      .hideTitleBar(true)
      .mode(NavigationMode.Auto)

    }
  }
}


@Component
struct MyCustomComponent {
  @Consume newName: string
  @ObjectLink myNumber: MyNumber
  @Consume data: number
  @Link mNumber2: Number2
  @Link number4: number

  aboutToAppear(): void {
    console.info("MyCustomComponent aboutToAppear")
  }

  onPageShow(): void {
    console.info("MyCustomComponent onPageShow")
  }

  onPageHide(): void {
    console.info("MyCustomComponent onPageHide")
  }

  aboutToDisappear(): void {
    console.info("MyCustomComponent aboutToDisappear")
  }

  build() {
    if (this.data < 100) {
      Text("MyCustomComponent1:" + "newName:" + this.newName + "myNumber:" + this.myNumber.n + "data:" + this.data +
        "number2:" +
      this.mNumber2.n + "number3" + this.number4)
        .width("100%")
        .onClick(() => {
          this.newName = "你好"
          this.myNumber.n = 2
          this.data = 3
          this.mNumber2.n = 444
          this.number4 = 55
        })
    }
  }
}

@Component
struct MyCustomComponent2 {
  @Consume newName: string
  @ObjectLink myNumber: MyNumber
  @Consume data: number
  @Link mNumber2: Number2
  @Link number4: number

  aboutToAppear(): void {
    console.info("MyCustomComponent aboutToAppear")
  }

  onPageShow(): void {
    console.info("MyCustomComponent onPageShow")
  }

  onPageHide(): void {
    console.info("MyCustomComponent onPageHide")
  }

  aboutToDisappear(): void {
    console.info("MyCustomComponent aboutToDisappear")
  }

  build() {
    Text("MyCustomComponent1:" + "newName:" + this.newName + "myNumber:" + this.myNumber.n + "data:" + this.data +
      "number2:" +
    this.mNumber2.n + "number3" + this.number4)
      .width("100%")
      .onClick(() => {
        this.newName = "你好"

        this.myNumber.n = 3
        this.data = 4
      })
  }
}

@Component
struct comp3 {
  @Consume data: number
  @Prop data2: number

  build() {
    Text("data:" + this.data + "\t data2:" + this.data2)
      .width("100%")
      .onClick(() => {
        this.data = 6
        this.data2 = 33
      })
  }
}