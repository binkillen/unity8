/*
 * Copyright (C) 2014 Canonical, Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0
import Ubuntu.Components 0.1

/*! Widget that can be used in combination with a text area to allow easy 'expand/collapse' functionality. */

Item {
    /// type:bool Boolean set to true when it suggests expanded functionality
    property bool more: false

    implicitHeight: seeMoreLabel.height + units.gu(2)

    Row {
        anchors.centerIn: parent
        spacing: units.gu(2)

        Label {
            id: seeMoreLabel
            objectName: "seeMoreLabel"
            text: i18n.tr("See more")
            opacity: !more ? 0.8 : 0.4
            color: Theme.palette.selected.backgroundText
            font.weight: Font.Bold

            MouseArea {
                anchors.fill: parent
                onClicked: more = true
            }
        }

        Row {
            height: parent.height

            Rectangle {
                width: units.dp(1)
                height: parent.height
                opacity: 0.2
                color: Theme.palette.selected.backgroundText
            }
            Rectangle {
                width: units.dp(1)
                height: parent.height
                color: Qt.rgba(1.0, 1.0, 1.0, 0.1)
            }
        }

        Label {
            objectName: "seeLessLabel"
            text: i18n.tr("See less")
            opacity: more ? 0.8 : 0.4
            color: Theme.palette.selected.backgroundText
            font.weight: Font.Bold

            MouseArea {
                anchors.fill: parent
                onClicked: more = false
            }
        }
    }
}
