@Preview
@Entry
@Component
struct Splash {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text("Splash").fontSize("40lpx")
    }.alignSelf(ItemAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width("100%")
    .height("100%")
  }
}