import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import qualified XMonad.StackSet as W

main =
  xmonad $ defaultConfig {
      terminal = "alacritty"
    }
    `additionalKeysP`
    [ ("M-<Up>", spawn "rofi -show run") ]
