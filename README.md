# THQRManager
#### Super Easy QR Scanner and QR Image Generate.

# Feature
- [x] pure swift 5.0 code

# Installation

#### CocoaPods
Simply add THQRManager to your `Podfile`.

```
pod 'THQRManager'
```
Enter command instruction into your terminal.

```
pod install
```

# Usage

THQRGenerator : You can use into extension at String type value.
```
import THQRManager

let string = "https://www.github.com"
let qrImage: UIImage = string.thQRGenerator()
```

THQRScanView : You must create UIView and it use custom class in the storyboard after install THQRScanView.

Then you must also import THQRScanView and create a IBOutlet, and include THQRScanViewDelegate

The following sample code for your reference.

```swift
import UIKit
import THQRManager

class ViewController: UIViewController, THQRScanViewDelegate {

    @IBOutlet weak var thQRScanView: THQRScanView!

    override func viewDidLoad() {
        super.viewDidLoad()

        thQRScanView.delegate = self
        thQRScanView.startCapture() // 애니메이션 시작
        thQRScanView.stopCapture()  // 애니메이션 종료
    }

    func reccivedQRImage(string: String?) {
        let alert = UIAlertController(title: "성공", message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

        alert.addAction(ok)
        present(alert, animated: true)
    }

    func failScanQRImage(string: String?) {

        let alert = UIAlertController(title: "실패", message: string, preferredStyle: .alert)
        let ok = UIAlertAction(title: "확인", style: .default, handler: nil)

        alert.addAction(ok)
        present(alert, animated: true)
    }
}
```

# License

THQRManager is available under the MIT license. See the LICENSE file for more info.
