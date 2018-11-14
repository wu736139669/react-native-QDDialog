
import {NativeModules, Platform} from 'react-native';

let handler;
if (Platform.OS === 'ios') {
    handler = NativeModules.QXXDialogModule;
} else {
    handler = NativeModules.QXXDialogModule;
}

/**
 * 调用Dialog
 */
function showContentDialog(title, content, confirmStr, canBack, touchOutSideDismiss) {
    return handler.showContentDialog(title, content, confirmStr, canBack, touchOutSideDismiss);
}

function showInfoDialog(title, content, confirmStr, cancelStr, canBack, touchOutSideDismiss) {
    return handler.showInfoDialog(title, content, confirmStr, cancelStr, canBack, touchOutSideDismiss);
}

function showLoadingDialog(title) {
    if (Platform.OS === 'ios') {
        handler.showLoadingDialog(title);
    } else {
        console.log(handler)
        handler.showLoadingDialog(title);
    }

}

function hideLoadingDialog() {
    if (Platform.OS === 'ios') {
        handler.hideLoadingDialog();
    } else {
        handler.hideLoadingDialog();
    }

}


export default {
    showInfoDialog,
    showContentDialog,
    showLoadingDialog,
    hideLoadingDialog
}
