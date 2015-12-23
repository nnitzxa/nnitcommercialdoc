###如何在Mac OSX系统下安装配置ionic开发环境
1. Prerequisites
   
   * 已安装git命令行工具
   
2. 安装Node.js
   
   * 使用OSX下的包管理器brew安装Node.js，命令为：`brew install node`，或直接在[这里](https://nodejs.org/en/#download)下载安装包进行安装。默认会下载稳定的5.0.0版。（Dec.2015）
   * 设置环境变量以使node命令在终端中可用。（待扩充）
   * 按照ionic官方说法，ionic需要Node.js 4.0版本，而不支持Node.js 5版本（[见ionic入门的“Install Ionic”一节](http://ionicframework.com/getting-started/)），但实际中Node.js 5仍可使用，如果要谨慎起见，按官方的提示操作，则可以通过官网直接下载安装包获得第4版的Node.js安装包。
   
3. 安装cordova, ionic

   使用Node.js的包管理工具npm将cordova和ionic安装在全局：`npm install -g cordova ionic`

4. 安装iOS相关工具
   
   通过App Store下载并安装XCode及XCode组件Command Line Tools。ionic开发需要随XCode安装的iOS模拟器。
   
5. 安装Android相关工具（待扩充）

   安装Android相关SDK以后，需要将%ANDROID_HOME%/tools和%ANDROID_HOME%/platform-tools这两个目录追加到环境变量$PATH中。同时，使用Android的SDK Manager安装API 22版。

6. 打包成iOS/Android应用（待扩充）
   
   跟着ionic官网的[指南](http://ionicframework.com/docs/guide/)构建Demo。开发iOS版App，可选择使用模拟器，运行`ionic emulate ios`命令即可运行编写好的ionic项目；开发Android版App，可选择使用GenyMotion的Android模拟器，或者实机，实机运行使用命令`ionic run android`。


####**附录1.使用Markdowns标记语言**

　　使用Markdown标记语言进行文档撰写可以获得比word等富文本编辑器更低的学习门槛，更易掌控的编写体验。Markdown足够简单，用它编写的源文本文件拥有比其它标记语言如html更高的可读性。同时，将编辑好的*.md文件在上传到Github等支持Markdown文件解析的站点后，可以在网页中方便地查看带有文本样式的文档内容。

　　关于Markdown语言的基本语法，可以参见[Github的相关帮助](https://help.github.com/articles/markdown-basics/)。