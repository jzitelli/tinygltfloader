solution "glview"
   -- location ( "build" )
   configurations { "Debug", "Release" }
   platforms {"native", "x64", "x32"}

   project "glview"

      kind "ConsoleApp"
      language "C++"
      files { "glview.cc", "trackball.cc" }
      includedirs { "./" }
      includedirs { "../../" }

      configuration { "linux" }
         linkoptions { "`pkg-config --libs glfw3`" }
         links { "GL", "GLU", "m", "GLEW", "X11", "Xrandr", "Xinerama", "Xi", "Xxf86vm", "Xcursor", "dl" }

      configuration { "windows" }
         -- Edit path to glew and GLFW3 fit to your environment.
         includedirs { "/Users/zemed/Desktop/glew-1.13.0-win32/glew-1.13.0/include/" }
         includedirs { "/Users/zemed/GitHub/glfw/include/" }
         libdirs { "/Users/zemed/Desktop/glew-1.13.0-win32/glew-1.13.0/lib/Release/Win32/" }
         libdirs { "/Users/zemed/Desktop/glfw-win32/src/Release/" }
         links { "glfw3", "gdi32", "winmm", "user32", "glew32", "glu32","opengl32", "kernel32" }
         defines { "_CRT_SECURE_NO_WARNINGS" }

      configuration { "macosx" }
         includedirs { "/usr/local/include" }
         buildoptions { "-Wno-deprecated-declarations" }
         libdirs { "/usr/local/lib" }
         links { "glfw3", "GLEW" }
         linkoptions { "-framework OpenGL", "-framework Cocoa", "-framework IOKit", "-framework CoreVideo" }

      configuration "Debug"
         defines { "DEBUG" }
         flags { "Symbols", "ExtraWarnings"}

      configuration "Release"
         defines { "NDEBUG" }
         flags { "Optimize", "ExtraWarnings"}

