import XMonad
import XMonad.Config.Desktop

main :: IO ()
main = xmonad desktopConfig
	{ terminal 		= "alacritty"
	, borderWidth = 3
	}
