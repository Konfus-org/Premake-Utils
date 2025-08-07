project "Premake (Build To Run Premake)"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "Off"
    files
    {
        "%{wks.location}/**.lua",
    }
    prebuildcommands
    {
        -- TODO: Make this cross platform, maybe via python script
        "\"%{wks.location}\\Tools\\Premake\\premake5.exe\" vs2022"
    }
