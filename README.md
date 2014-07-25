StoryboardXibController
===

**StoryboardXibController** is a utility class made to separate complex view controllers and view data out of your storyboard and into your Xibs, all within Xcode's Interface Builder.

Using this class you can easily load an Xib from within a storyboard at runtime. Currently this is restricted to Xib files whose **File's Owner** is a `UIViewController` or `UIViewController` subclass.

Installation
---
**StoryboardXibController** is available through **[cocoapods](http://cocoapods.org)**, to install simple add the following line to your `PodFile`:

``` ruby
  pod "StoryboardXibController"
```

Alternatively you can clone the **[github repo](https://github.com/Codecademy/StoryboardXibController)**.

Setup
---
Once you've installed the class:

* Add a new view controller scene to your storyboard. 

* Find the **Custom Class** property within the view controller's **Identity Inspector** tab

* Change the view controller's **Custom Class** from `UIViewController` to `StoryboardXibController`.

![Custom Class](https://github.com/Codecademy/StoryboardXibController/blob/master/README/Class.png?raw=true)
 
* Find the **User Defined Runtime Attributes** within the same **Identity Inspector** tab

* Add an attribute with the **Key Path** `screenControllerClass` of **Type** `String` with the **Value** of the name of the class of your `Xib`'s **File's Owner**/main view controller.

![screenControllerClass](https://github.com/Codecademy/StoryboardXibController/blob/master/README/AttributeScreenControllerClass.png?raw=true)

* Add a second attribute with the **Key Path** `screenNib` of **Type** `String` with the `Value` of the name of the `Xib` file you wish to load.

![screenNib](https://github.com/Codecademy/StoryboardXibController/blob/master/README/AttributeScreenNib.png?raw=true)

* Enjoy!

Contributing
---
If you have any ideas, suggestions or bugs to report please [create an issue](https://github.com/Codecademy/StoryboardXibController/issues/new) labeled *feature* or *bug* (check to see if the issue exists first please!). Or suggest a pull request!
