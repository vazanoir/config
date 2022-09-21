import XMonad

import XMonad.Config.Desktop
import XMonad.Config.Bepo

import XMonad.Layout.Spacing
import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders

import XMonad.Hooks.WindowSwallowing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

import qualified Data.Map as M
import qualified XMonad.StackSet as W

main :: IO ()
main = xmonad $ withEasySB mySB defToggleStrutsKey desktopConfig
  { keys = myKeys
  , terminal = myTerminal
  , borderWidth = myBorderWidth
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
  , handleEventHook = mySwallowEventHook
  , layoutHook = myLayoutHook
  , manageHook = myManageHooks
  }
  `additionalKeysP` myAdditionalKeys

mySB = statusBarProp "xmobar" (pure xmobarPP)

-- KEYS
myKeys = \c -> bepoKeys c `M.union` keys desktopConfig c

myAdditionalKeys = 
 [ ("M-f", withFocused toggleFloat)
 , ("M-s", spawn "flameshot gui")
 ]

-- TERMINAL
myTerminal = "alacritty"

-- STYLE
myBorderWidth = 2
myNormalBorderColor = "#BCBCBC"
myFocusedBorderColor = "#6500e9"

-- Enable terminal to go into hell while starting an app from it
mySwallowEventHook = swallowEventHook (className =? "Alacritty") (return True)

-- Add gaps arround windows
myLayoutHook = lessBorders OnlyFloat $ avoidStruts $ spacingWithEdge 10 $ Tall 1 (3/100) (1/2) ||| Full

-- MANAGE HOOKS
myManageHooks = manageDocks

-- CUSTOM
toggleFloat :: Window -> X ()
toggleFloat w =
  windows
    ( \s ->
        if M.member w (W.floating s)
          then W.sink w s
          else (W.float w (W.RationalRect (0) (0) (1) (1)) s)
    )
