
# react-native-dialog

## Getting started

`$ npm install react-native-dialog --save`

### Mostly automatic installation

`$ react-native link react-native-dialog`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-dialog` and add `RNDialog.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNDialog.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.qudian.quxuexi.RNDialogPackage;` to the imports at the top of the file
  - Add `new RNDialogPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-dialog'
  	project(':react-native-dialog').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-dialog/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-dialog')
  	```


## Usage
```javascript
import RNDialog from 'react-native-dialog';

// TODO: What to do with the module?
RNDialog;
```
  