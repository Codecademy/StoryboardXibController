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

Alternatively you can clone the **[github repo](https://github.com/RyzacInc/StoryboardXibController)**.

Setup
---
Once you've installed the class:

1. Add a new view controller scene to your storyboard. 

2. Find the **Custom Class** property within the view controller's **Identity Inspector** tab

 
3. Change the view controller's **Custom Class** from `UIViewController` to `StoryboardXibController`.

4. Find the **User Defined Runtime Attributes** within the same **Identity Inspector** tab

5. Add an attribute with the **Key Path** `screenControllerClass` of **Type** `String` with the **Value** of the name of the class of your `Xib`'s **File's Owner**/main view controller.

6. Add a second attribute with the **Key Path** `screenNib` of **Type** `String` with the `Value` of the name of the `Xib` file you wish to load.

7. Enjoy!

Contributing
---
If you have any ideas, suggestions or bugs to report please [create an issue](https://github.com/RyzacInc/StoryboardXibController/issues/new) labeled *feature* or *bug* (check to see if the issue exists first please!). Or suggest a pull request!