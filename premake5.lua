project "SOIL2"

  kind "StaticLib"
  language "C"

  targetdir ("../../bin/" .. outputdir .. "/%{prj.name}")
  objdir ("../../obj/" .. outputdir .. "/%{prj.name}")

  files
  {
    "src/SOIL2/*.c"
  }


  -------------------------------
  -- PLATFORM SPECIFIC FILTERS --
  -------------------------------
  filter "system:windows"
    filter "action:vs*"
      buildoptions { "/TP" }
      defines { "_CRT_SECURE_NO_WARNINGS" }

    filter "action:not vs*"
      language "C"
      buildoptions { "-Wall" }
    filter {}

  filter "system:linux"

  filter "system:macosx"
    defines { "GL_SILENCE_DEPRECATION" }
  filter {}


  ------------------------------------
  -- CONFIGURATION SPECIFIC FILTERS --
  ------------------------------------
  filter "configurations:Debug"
    defines
    {
      "DEBUG"
    }
    symbols "On"
  filter "configurations:OptimizedDebug"
    defines
    {
      "DEBUG"
    }
    symbols "On"
    optimize "Debug"
  filter "configurations:Release"
    defines
    {
      "NDEBUG"
    }
    optimize "On"
    filter {} -- clean slate!


  -------------------------------
  -- COMPILER SPECIFIC FILTERS --
  -------------------------------
  filter "toolset:gcc"
    links
    {
    }
    buildoptions
    {
    }

  filter "toolset:clang"

  filter "msc"

  filter {}
