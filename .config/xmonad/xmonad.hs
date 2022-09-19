import XMonad

import XMonad.Config.Desktop
import XMonad.Config.Bepo

import XMonad.Hooks.WindowSwallowing

import qualified Data.Map as M

main :: IO ()
main = xmonad desktopConfig
  { keys            = \c -> bepoKeys c `M.union` keys desktopConfig c
	, terminal        = "alacritty"
	, borderWidth     = 3
	, handleEventHook = swallowEventHook (className =? "Alacritty") (return True)
	}
