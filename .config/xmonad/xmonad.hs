-- IMPORTS

-- base
import XMonad

-- config
import XMonad.Config.Desktop
import XMonad.Config.Bepo

-- layout
import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders

-- hooks
import XMonad.Hooks.WindowSwallowing
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

-- util
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce

-- other
import qualified Data.Map as M
import qualified XMonad.StackSet as W

-- CUSTOM CONFIG

-- status bar
mySB = statusBarProp "xmobar" (pure xmobarPP)

-- autostart
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "setxkbmap fr bepo_afnor"
  spawnOnce "picom"
  spawnOnce "feh --bg-fill --no-fehbg $HOME/Images/color.png"
  spawnOnce "/usr/bin/redshift"
  spawnOnce "darkman set dark"

-- keys
myKeys = \c -> bepoKeys c `M.union` keys desktopConfig c

myAdditionalKeys = 
 [ ("M-f", withFocused toggleFullscreenFloat)
 , ("M-s", spawn "flameshot gui")
 , ("M-p", spawn "rofi -show drun")
 ]

-- terminal
myTerminal = "alacritty"

-- style
myBorderWidth = 3
myNormalBorderColor = "#1C2023"
myFocusedBorderColor = "#ae95c7"

-- event hook
myEventHook = mySwallowEventHook
mySwallowEventHook = swallowEventHook (className =? "Alacritty") (return True)

-- layout
myLayoutHook = smartBorders $ spacingWithEdge 5 $ Tall 1 (3/100) (1/2) ||| Full

-- custom functions
toggleFullscreenFloat :: Window -> X ()
toggleFullscreenFloat w =
  windows
    ( \s ->
        if M.member w (W.floating s)
          then W.sink w s
          else (W.float w (W.RationalRect (0) (0) (1) (1)) s)
    )

-- MAIN
main :: IO ()
main = xmonad 
  $ fullscreenSupportBorder
  $ withEasySB mySB defToggleStrutsKey 
  $ desktopConfig
  { keys = myKeys
  , terminal = myTerminal
  , borderWidth = myBorderWidth
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
  , startupHook = myStartupHook
  , handleEventHook = myEventHook
  , layoutHook = myLayoutHook
  }
  `additionalKeysP` myAdditionalKeys
