import XMonad

import XMonad.Config.Desktop
import XMonad.Config.Bepo

import XMonad.Layout.Spacing

import XMonad.Hooks.WindowSwallowing

import XMonad.Util.SpawnOnce

import qualified Data.Map as M

main :: IO ()
main = xmonad desktopConfig
  { keys            = myKeys
	, terminal        = myTerminal
	, borderWidth     = myBorderWidth
	, handleEventHook = mySwallowEventHook
	, layoutHook      = myLayoutHook
	, startupHook     = myStartupHook
	}

-- Adapt the default layout to bépo
myKeys = \c -> bepoKeys c `M.union` keys desktopConfig c

myTerminal = "alacritty"

myBorderWidth = 3

-- Launch programs once on startup
myStartupHook = do
  spawnOnce "feh --bg-scale $HOME/Images/moon-satelite.png"
  spawnOnce "setxkbmap fr bepo_afnor"
  spawnOnce "picom"

-- Enable terminal to go into hell while starting an app from it
mySwallowEventHook = swallowEventHook (className =? "Alacritty") (return True)

-- Add gaps arround windows
myLayoutHook = spacingWithEdge 7 $ Tall 1 (3/100) (1/2) ||| Full
