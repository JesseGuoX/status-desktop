import QtQuick 2.13

QtObject {
    id: theme

    property string name

    property var baseFont: FontLoader {
        source: "../../../assets/fonts/Inter/Inter-Regular.otf"
    }

    property var monoFont: FontLoader {
        source: "../../../assets/fonts/InterStatus/InterStatus-Regular.otf"
    }

    property var codeFont: FontLoader {
        source: "../../../assets/fonts/RobotoMono/RobotoMono-Regular.ttf"
    }

    readonly property QtObject _d: QtObject {
        // specific font variants should not be accessed directly

        // Inter font variants
        property var baseFontThin: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-Thin.otf"
        }

        property var baseFontExtraLight: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-ExtraLight.otf"
        }

        property var baseFontLight: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-Light.otf"
        }

        property var baseFontMedium: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-Medium.otf"
        }

        property var baseFontBold: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-Bold.otf"
        }

        property var baseFontExtraBold: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-ExtraBold.otf"
        }

        property var baseFontBlack: FontLoader {
            source: "../../../assets/fonts/Inter/Inter-Black.otf"
        }

        // Inter Status font variants
        property var monoFontThin: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-Thin.otf"
        }

        property var monoFontExtraLight: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-ExtraLight.otf"
        }

        property var monoFontLight: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-Light.otf"
        }

        property var monoFontMedium: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-Medium.otf"
        }

        property var monoFontBold: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-Bold.otf"
        }

        property var monoFontExtraBold: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-ExtraBold.otf"
        }

        property var monoFontBlack: FontLoader {
            source: "../../../assets/fonts/InterStatus/InterStatus-Black.otf"
        }

        // Roboto font variants
        property var codeFontThin: FontLoader {
            source: "../../../assets/fonts/RobotoMono/RobotoMono-Thin.ttf"
        }

        property var codeFontExtraLight: FontLoader {
            source: "../../../assets/fonts/RobotoMono/RobotoMono-ExtraLight.ttf"
        }

        property var codeFontLight: FontLoader {
            source: "../../../assets/fonts/RobotoMono/RobotoMono-Light.ttf"
        }

        property var codeFontMedium: FontLoader {
            source: "../../../assets/fonts/RobotoMono/RobotoMono-Medium.ttf"
        }

        property var codeFontBold: FontLoader {
            source: "../../../assets/fonts/RobotoMono/RobotoMono-Bold.ttf"
        }
    }

    property color black: getColor('black')
    property color white: getColor('white')
    property color transparent: "#00000000"

    property color dropShadow: getColor('black', 0.12)
    property color dropShadow2
    property color backdropColor: getColor('black', 0.4)

    function hoverColor(normalColor) {
        return theme.name === "light" ? Qt.darker(normalColor, 1.1) : Qt.lighter(normalColor, 1.1)
    }

    property color baseColor1
    property color baseColor2
    property color baseColor3
    property color baseColor4
    property color baseColor5

    property color primaryColor1
    property color primaryColor2
    property color primaryColor3

    property color dangerColor1
    property color dangerColor2
    property color dangerColor3

    property color warningColor1
    property color warningColor2
    property color warningColor3

    property color successColor1
    property color successColor2
    property color successColor3

    property color mentionColor1
    property color mentionColor2
    property color mentionColor3
    property color mentionColor4

    property color pinColor1
    property color pinColor2
    property color pinColor3

    property color directColor1
    property color directColor2
    property color directColor3
    property color directColor4
    property color directColor5
    property color directColor6
    property color directColor7
    property color directColor8
    property color directColor9

    property color indirectColor1
    property color indirectColor2
    property color indirectColor3

    property color miscColor1
    property color miscColor2
    property color miscColor3
    property color miscColor4
    property color miscColor5
    property color miscColor6
    property color miscColor7
    property color miscColor8
    property color miscColor9
    property color miscColor10
    property color miscColor11
    property color miscColor12

    property color statusFloatingButtonHighlight

    property color statusLoadingHighlight
    property color statusLoadingHighlight2

    property color messageHighlightColor

    property var userCustomizationColors: []

    property var identiconRingColors: []

    property QtObject statusAppLayout: QtObject {
        property color backgroundColor
        property color rightPanelBackgroundColor
    }

    property QtObject statusAppNavBar: QtObject {
        property color backgroundColor
    }

    property QtObject statusToastMessage: QtObject {
        property color backgroundColor
    }

    property QtObject statusListItem: QtObject {
        property color backgroundColor
        property color secondaryHoverBackgroundColor
        property color highlightColor
    }

    property QtObject statusChatListItem: QtObject {
        property color hoverBackgroundColor
        property color selectedBackgroundColor
    }

    property QtObject statusChatListCategoryItem: QtObject {
        property color buttonHoverBackgroundColor
    }

    property QtObject statusNavigationListItem: QtObject {
        property color hoverBackgroundColor
        property color selectedBackgroundColor
    }

    property QtObject statusBadge: QtObject {
        property color foregroundColor
        property color borderColor
        property color hoverBorderColor
    }

    property QtObject statusChatInfoButton: QtObject {
        property color backgroundColor
        property color hoverBackgroundColor
    }

    property QtObject statusMenu: QtObject {
        property color backgroundColor
        property color hoverBackgroundColor
        property color separatorColor
    }

    property QtObject statusModal: QtObject {
        property color backgroundColor
    }

    property QtObject statusRoundedImage: QtObject {
        property color backgroundColor
    }

    property QtObject statusChatInput: QtObject {
        property color secondaryBackgroundColor
    }

    readonly property QtObject statusSwitchTab: QtObject {
        property color buttonBackgroundColor: primaryColor1
        property color barBackgroundColor: primaryColor3
        property color selectedTextColor: indirectColor1
        property color textColor: primaryColor1
    }

    property QtObject statusSelect: QtObject {
        property color menuItemBackgroundColor
        property color menuItemHoverBackgroundColor
    }

    property QtObject statusMessage: QtObject {
        property color emojiReactionBackground
        property color emojiReactionBackgroundHovered
        property color emojiReactionActiveBackground
        property color emojiReactionActiveBackgroundHovered
    }

    property QtObject walletAccountColors: QtObject {
        function getHoveredColor(color) {
            switch(color) {
            case getColor('black'):
                return getColor('blackHovered')
            case getColor('grey'):
                return getColor('grey2')
            case getColor('white'):
                return getColor('grey4')
            case getColor('blue2'):
                return getColor('blueHovered')
            case getColor('purple'):
                return getColor('purpleHovered')
            case getColor('cyan'):
                return getColor('cyanHovered')
            case getColor('violet'):
                return getColor('violetHovered')
            case getColor('red2'):
                return getColor('redHovered')
            case getColor('yellow'):
                return getColor('yellowHovered')
            case getColor('green2'):
                return getColor('greenHovered')
            case getColor('moss'):
                return getColor('mossHovered')
            case getColor('brown'):
                return getColor('brownHovered')
            case getColor('brown2'):
                return getColor('brown2Hovered')
            default: return ""
            }
        }
    }

    function alphaColor(color, alpha) {
        let actualColor = Qt.darker(color, 1)
        actualColor.a = alpha
        return actualColor
    }

    function getColor(name, alpha) {
        return !!alpha ? alphaColor(StatusColors.colors[name], alpha)
                       : StatusColors.colors[name]
    }
}
