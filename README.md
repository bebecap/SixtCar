# SixtCar

### Usage requirements
- XCode 11.2 
- iOS 13

### What's done
- MVVM with RxSwift
- Loading vehicle list from the given [link](https://cdn.sixt.io/codingtask/cars)
- 2 representations for vehicle list: Map and View 
- Error handling

### Known issues
- Tests are missing
- Storyboards instead of SwiftUI are used due to lack of documentation and still lagging XCode :| 

### 3rd party libraries 
- `pod 'Alamofire'` - Networking
- `pod 'RxSwift'` - Reactive programming 
- `pod 'RxCocoa'` - an add-on for RxSwift to extend standard UI elements
- `pod 'Kingfisher'` - Downloading and caching images 
