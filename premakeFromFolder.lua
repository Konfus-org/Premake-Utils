-- Loads all projects in a folder (not recursive)
function LoadProjectsFromFolder(folderPath, groupName, applyConfigsFunc)

    local subdirs = os.matchdirs(folderPath .. "/*")
    table.sort(subdirs) -- Optional: consistent load order

    for _, dir in ipairs(subdirs) do
        local name = path.getname(dir)

        group(groupName) -- Start group

        local entryScript = path.join(dir, "premake5.lua")
        if os.isfile(entryScript) then
            dofile(entryScript)
            if applyConfigsFunc ~= nil then
                applyConfigsFunc()
            end
        else
            -- Fallback: assume file is named after project
            local defaultScript = path.join(dir, name .. ".lua")
            if os.isfile(defaultScript) then
                dofile(defaultScript)
                if applyConfigsFunc ~= nil then
                    applyConfigsFunc()
                end
            else
                -- do nothing...
            end
        end

        group("") -- Exit group context
    end
end