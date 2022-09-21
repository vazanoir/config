Config { font = "xft:Source Sans:size=10:semibold:antialias=true"
       , additionalFonts = 
       [ "xft:Symbols Nerd Font:size=13:semibold:antialias=true"
       ]
       , bgColor = "#0A0A0A"
       , fgColor = "#BCBCBC"
       , position = Top
       , commands = [ Run Weather "LFLY" ["-t","<station>: <tempC>°C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
                    , Run Cpu ["-t", "CPU <total>%"] 10
    		            , Run DateZone "%H:%M:%S - %a %_d %b %Y" "fr_FR.UTF-8" "Europe/Paris" "date" 10
    		            , Run DynNetwork ["-t","<fn=1>\xf6d9</fn> <rx> - <fn=1>\xfa51</fn> <tx>", "-S", "true"] 10
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " }{ %cpu%      %dynnetwork%      <fc=#F2DD1D>%date%</fc>      %LFLY% "
       }
