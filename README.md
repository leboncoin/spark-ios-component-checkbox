# Checkbox
The checkbox component is comprised of a box and label. If there is a group of checkboxes, a group label can be added.

## Specifications
The checkbox specifications on Zeroheight is [here](https://spark.adevinta.com/1186e1705/p/76f5a8-checkbox).

![Figma anatomy](https://github.com/adevinta/spark-ios-component-checkbox/blob/main/.github/assets/anatomy.png)

## Usage
Checkboxes are available both in UIKit and SwiftUI. For standalone usage there are `CheckboxUIView` and `CheckboxView`. For group usage - `CheckboxUIGroupView` and `CheckboxGroupView`.

## CheckboxView SwiftUI
The SwiftUI component of the checkbox.

### CheckboxView Initializer
Checkbox has customizable parameters in initialization:
* `text`: The checkbox text.
* `checkedImage: Image`: The tick-checkbox image for checked-state.
* `alignment`: Positions the checkbox on the leading or trailing edge of the view.
* `theme`: The current Spark-Theme. [You always can define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The current intent of component.`.main` by default.
* `isEnabled`: The parameter describes whether the checkbox is enabled or disabled. `true` by default.
* `selectionState`: `CheckboxSelectionState` is either selected, unselected or indeterminate.

## CheckboxUIView UIKit
The UIKit component of the checkbox.

### CheckboxUIView Initializer
Checkbox has customizable parameters in initialization:
* `theme`: The current Spark-Theme. [You always can define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The current intent of component.`.main` by default.
* `text: String`: The checkbox text.
* `attributedText: NSAttributedString`. An alternative attributed text to the plain text label of the checkbox.
* `checkedImage: UIImage`: The tick-checkbox image for checked-state.
* `isEnabled: Bool`: The control state describes whether the checkbox is enabled or disabled.`true` by default.
* `selectionState: CheckboxSelectionState`: `CheckboxSelectionState` is either selected, unselected or indeterminate.
* `alignment: CheckboxAlignment`: Positions the checkbox on the leading or trailing edge of the view.

### CheckboxUIView Properties
* `delegate: CheckboxUIViewDelegate`? An optional delegate which may be set to be notified of changes to the checkbox. The delegate may be used as an alternative to the publisher to be informed of state changes. 
* `publisher: some Publisher<CheckboxSelectionState, Never>` All state changes to the checkbox will be published to the publisher. The publisher is an alternative to the delegate to be informed of state changes.
* `text: String?` The label displayed to the checkbox.
* `attributedText: NSAttributedString?` As an alternative to the text, an attributed text may be used for the label
* `checkedImage: UIImage`: The tick-checkbox image for checked-state.
* `selectionState: CheckboxSelectionState`. The current selection state of the checkbox.
* `theme: Theme`. The current theme.
* `intent`: The current intent.
* `alignment: CheckboxAlignment`: Positions the checkbox on the leading or trailing edge of the view.
* `isEnabled: Bool`. The control state of the checkbox (e.g. `true` or `false`).

# Checkbox Group

## CheckboxGroupView SwiftUI
A SwiftUI implementation of the check box group

### CheckboxGroupView Initialization
Group view has the following parameters:
* `title`: An optional group title displayed on top of the checkbox group.
* `checkedImage: Image`: The tick-checkbox image for checked-state.
* `items`: An array containing of multiple `CheckboxGroupItemProtocol`. Each array item is used to render a single checkbox.
* `layout`: The layout of the group can be horizontal or vertical.
* `alignment`: The checkbox is positioned on the leading or trailing edge of the view.
* `theme`: The Spark-Theme. [You always can define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The current intent of component.`.main` by default.
* `accessibilityIdentifierPrefix`: All checkbox-views are prefixed by this identifier followed by the `CheckboxGroupItemProtocol`-identifier.

## CheckboxUIGroupView UIKit
A UIKit implementation of the check box group.
### CheckboxUIGroupView Initialization
Group view has the following parameters:
* `title`: An optional group title displayed on top of the checkbox group.
* `checkedImage: UIImage`: The tick-checkbox image for checked-state.
* `items`: An array containing of multiple `CheckboxGroupItemProtocol`. Each array item is used to render a single checkbox.
* `layout`: The layout of the group can be horizontal or vertical.
* `alignment`: The checkbox is positioned on the leading or trailing edge of the view.
* `theme`: The Spark-Theme. [You always can define your own theme.](https://github.com/adevinta/spark-ios/wiki/Theming#your-own-theming)
* `intent`: The current intent of component.`.main` by default.
* `accessibilityIdentifierPrefix`: All checkbox-views are prefixed by this identifier followed by the `CheckboxGroupItemProtocol`-identifier.

### CheckboxUIGroupView Properties
* `delegate: CheckboxGroupUIViewDelegate?` An optional delegate CheckboxGroupUIViewDelegate` which may be set to retrieve changes to the checkboxes. A delegate may be used instead of the publisher.
* `publisher: some Publisher<[any CheckboxGroupItemProtocol], Never>`. Changes to the checkbox group are published to the publisher. As an alternative to subscribing to the published changes, a delegate may be used.
* `title: String?`. An optional title of the checkbox group displayed on top of the group.
* `checkedImage: UIImage`: The tick-checkbox image for checked-state.
* `layout: CheckboxGroupLayout`. The layout of the checkbox 
* `alignment: CheckboxAlignment`. The checkbox is positioned on the leading or trailing edge of the view.
* `intent:` The current intent.

## Examples
### CheckboxUIGroupView

```swift

private var items: [any CheckboxGroupItemProtocol] = [
   CheckboxGroupItemDefault(title: Self.multilineText, id: "1", selectionState: .selected, isEnabled: false),
   CheckboxGroupItemDefault(title: Self.multilineText, id: "2", selectionState: .unselected, isEnabled: true),
   CheckboxGroupItemDefault(attributedTitle: Self.attributeText, id: "3", selectionState: .indeterminate, isEnabled: true)
]

let groupView = CheckboxGroupUIView(
    checkedImage: checkedImage,
    items: self.items,
    layout: .vertical,
    alignment: .left,
    theme: theme,
    intent: .main,
    accessibilityIdentifierPrefix: "abc"
)

view.addSubview(groupView)

groupView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
groupView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
groupView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
groupView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

groupView.publisher.sink { [weak self] changedItems in
  // ...
}
.store(in: &self.subscriptions)
```
**CheckboxGroupUIViewDelegate**

    func checkboxGroup(_ checkboxGroup: SparkCheckbox.CheckboxGroupUIView, didChangeSelection states: [any SparkCheckbox.CheckboxGroupItemProtocol]) {
        states.enumerated().forEach { index, state in
            switch state.selectionState {
            case .selected:
                break
            case .indeterminate:
                break
            case .unselected:
                break
            }
        }
    }


### CheckboxGroupView

```swift
let position: CheckboxPosition
@State private var items: [any CheckboxGroupItemProtocol] = [
   CheckboxGroupItemDefault(title: Self.multilineText, id: "1", selectionState: .selected, isEnabled: false),
   CheckboxGroupItemDefault(title: Self.multilineText, id: "2", selectionState: .unselected, isEnabled: true),
   CheckboxGroupItemDefault(attributedTitle: Self.attributeText, id: "3", selectionState: .indeterminate, isEnabled: true)
]
@State private var isEnabled: CheckboxSelectionState = CheckboxSelectionState.selected
let checkedImage = UIImage(systemName: "checkmark")!.withRenderingMode(.alwaysTemplate)

var body: some View {
    CheckboxGroupView(
       checkedImage: checkedImage,
       items: $items,
       layout: .vertical,
       alignment: .left,
       theme: self.theme,
       intent: .main,
       accessibilityIdentifierPrefix: "group"
    )
    .disabled(self.isEnabled == .unselected)
}
```

### CheckboxUIView

```swift
private var checkBoxSelectionState: CheckboxSelectionState = .unselected
let checkedImage = UIImage(systemName: "checkmark")!.withRenderingMode(.alwaysTemplate)

let checkbox = CheckboxUIView(
    theme: theme,
    intent: .main,
    text: "Test",
    checkedImage: checkedImage,
    isEnabled: true,
    selectionState: self.checkBoxSelectionState ,
    alignment: .left
)
checkbox.accessibilityIdentifier = "abcCheckbox"
checkbox.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(checkbox)

checkbox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
checkbox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
checkbox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
checkbox.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

checkbox.publisher.sink { [weak self] changeState in
   // ...
}
.store(in: &self.subscriptions)
```

**CheckboxUIViewDelegate**

    func checkbox(_ checkbox: CheckboxUIView, didChangeSelection state: CheckboxSelectionState) {
       switch state.selectionState {
       case .selected:
           break
       case .indeterminate:
           break
       case .unselected:
           break
       }
    }

### CheckboxView

```swift
@State private var selection: CheckboxSelectionState = .selected

var body: some View {
    VStack {
        Text("Lorem Ipsum is dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard")

        CheckboxView(
            text: "Do you agree?", 
            checkedImage: checkedImage, 
            alignment: .left,
            theme: self.theme,
            intent: .main,
            selectionState: $selection
        )
        .disabled(self.isEnabled == .unselected)
    }

    // HStack Usage (There might be improvment here to get rid of .fixedSize() modifier)

    HStack {
        Text("Lorem Ipsum is dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard")

        CheckboxView(
            text: "Do you agree?", 
            checkedImage: checkedImage, 
            alignment: .left,
            theme: self.theme,
            intent: .main,
            selectionState: $selection
        )
        .disabled(self.isEnabled == .unselected)
        .fixedSize(horizontal: false, vertical: true)
    }
}
```

## License

```
MIT License

Copyright (c) 2024 Adevinta

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
