# MockBob
A macOS menubar app you don't need. Used as a quick way to convert text to mOCkbOb tExT. 

Don't model your own projects off of this code. It works, but that is about all I can say for it.

## WHAt is ThIS
~This is what happens when you want to make something for macOS and only have terrible ideas.~

MockBob is a macOS menubar app that helps you avoid peak productivity. You can type or paste text in and it will be converted into "Mocking Spongebob" format. If you have no idea what this means, [you should get to know your memes.](https://knowyourmeme.com/memes/mocking-spongebob)

## WHy dId YoU MAke tHIs
I got tired of having to google a "spongebob mock generator" online every time I wanted to meme. 

## HOw Do i usE IT
### Prebuilt
You can install the latest version of MockBob by visiting the [releases page](https://github.com/jagrider/MockBob/releases). Download the `.dmg` file and install just like any other macOS application. Each version of MockBob has been [notarized](https://developer.apple.com/documentation/xcode/notarizing_macos_software_before_distribution) by Apple.

But, if you're like me, you might want to build it from source. Continue onward!

### Build it yourself

If you'd rather build the app yourself:
1. Make sure the latest version of Xcode is installed
2. Download the source code included with each release, or clone this repository
3. Open the project in Xcode. You can do this by opening the MockBob.xcodeproj file, or in `Xcod`e -> `File` -> `Open` -> Select the folder containing MockBob AND MockBob.xcodeproj
4. Use `CMD+B` to build it. Alternatively, in the top menu do `Product` -> `Build`.
5. Under the Products folder in Xcode you should see `MockBob.app`. `Right click` -> `Show in Finder` -> Copy with `CMD+C`
6. Open the Applications folder and Paste with `CMD+V`
7. Meme to your heart's content

## AppFacts
- Written in 100% Swift
- No external dependencies
- No internet connection
- 100% Meme Power

# WhATS neXT?
Features I am thinking about adding:
- Add Preferences Window
- Global keyboard shortcut to meme even faster
- Auto-open on startup
- Other things
