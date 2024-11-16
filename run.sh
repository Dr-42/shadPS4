export SDL_GAMECONTROLLERCONFIG="030000005e0400008e02000014010000,Xbox 360 Controller,a:b0,b:b1,x:b2,y:b3,back:b6,start:b7,leftstick:b8,rightstick:b9,leftshoulder:b4,rightshoulder:b5,dpup:h0.1,dpdown:h0.4,dpleft:h0.8,dpright:h0.2,leftx:a0,lefty:a1,rightx:a3,righty:a4,lefttrigger:a2,righttrigger:a5,trigger_l_deadzone:0.55,trigger_r_deadzone:0.55"
export DISPLAY=:0

if [ "$1" = "run" ]; then
  ./build/shadps4
elif [ "$1" = "build" ]; then
  cmake -S . -B build/ -DENABLE_QT_GUI=ON
  cmake --build build --parallel$(nproc)
else
  export QT_QPA_PLATFORM="xcb"
  gamescope -w 792 -h 432 -W 1980 -H 1080 -r 60 -F nis ./build/shadps4 /home/spandan/PS4Games/CUSA03173/eboot.bin
fi
