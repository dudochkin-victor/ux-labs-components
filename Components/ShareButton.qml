/*
 * Copyright 2011 Intel Corporation.
 *
 * This program is licensed under the terms and conditions of the
 * Apache License, version 2.0.  The full text of the Apache License is at	
 * http://www.apache.org/licenses/LICENSE-2.0
 */

import Qt 4.7
import MeeGo.Sharing 0.1

ShareObj {

    id: shareContainer

    signal shareAllClicked();

    property bool shareAll: false

    function doShareAll() {
        if (shareCount == 0)
            return;
        var pos = topItem.topItem.mapFromItem(shareBtn, shareBtn.x+shareBtn.width, shareBtn.y);
        showContextTypes(pos.x, pos.y);
    }

    TopItem {
        id: topItem
    }

    Button {
        id: shareBtn
        width: 120  //TODO - theme/auto calc?
        height: 50  //TODO - theme/auto calc?
        enabled: {
            if ((shareCount != 0) || shareAll)
                return true;
            return false;
        }

        title: ((shareAll && shareCount == 0) ?
                qsTr("Share All") : qsTr("Share"))

        onClicked: {
            if (shareAll && shareCount == 0) {
                shareContainer.shareAllClicked();
            } else {
                var pos = topItem.topItem.mapFromItem(shareBtn, shareBtn.x+shareBtn.width, shareBtn.y);
                parent.showContextTypes(pos.x, pos.y);
            }
        }
    }
}
