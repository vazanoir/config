import XMonad

import XMonad.Config.Desktop
import XMonad.Config.Bepo

import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders

import XMonad.Hooks.WindowSwallowing
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops

import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

import qualified Data.Map as M
import qualified XMonad.StackSet as W

main :: IO ()
main = xmonad 
  $ ewmhFullscreen
  $ withEasySB mySB defToggleStrutsKey desktopConfig
  { keys = myKeys
  , terminal = myTerminal
  , borderWidth = myBorderWidth
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
  , handleEventHook = myEventHook
  , startupHook = myStartupHook
  , layoutHook = myLayoutHook
  }
  `additionalKeysP` myAdditionalKeys

mySB = statusBarProp "xmobar" (pure xmobarPP)

-- KEYS
myKeys = \c -> bepoKeys c `M.union` keys desktopConfig c

myAdditionalKeys = 
 [ ("M-f", withFocused toggleFullscreenFloat)
 , ("M-s", spawn "flameshot gui")
 , ("M-p", spawn "rofi -show drun")
 ]

-- TERMINAL
myTerminal = "alacritty"

-- STYLE
myBorderWidth = 3
myNormalBorderColor = "#1C2023"
myFocusedBorderColor = "#95AEC7"

-- EVENT HOOK
myEventHook = mySwallowEventHook
mySwallowEventHook = swallowEventHook (className =? "Alacritty") (return True)

-- STARTUP HOOK
myStartupHook = do
  startupHook desktopConfig
  spawnOnce "setxkbmap fr bepo_afnor"
  spawnOnce "picom"
  spawnOnce "feh --bg-fill --no-fehbg $HOME/Images/color.png"
  spawnOnce "redshift"

-- LAYOUT
myLayoutHook = smartBorders $ spacingWithEdge 5 $ Tall 1 (3/100) (1/2) ||| Full

-- CUSTOM FUNCTIONS
toggleFullscreenFloat :: Window -> X ()
toggleFullscreenFloat w =
  windows
    ( \s ->
        if M.member w (W.floating s)
          then W.sink w s
          else (W.float w (W.RationalRect (0) (0) (1) (1)) s)
    )
