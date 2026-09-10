-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/

-- Default beziers
-- hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
-- hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("overshoot",      { type = "bezier", points = { {0.5, 0.9}, {0.1, 1.1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 500, dampening = 35 })
hl.curve("rubber",         { type = "spring", mass = 1, stiffness = 200,  dampening = 15 })

-- Animations
-- hl.animation({ leaf = "global",              enabled = true, speed = 3, bezier = "quick"                 })
-- hl.animation({ leaf = "windows",             enabled = true, speed = 3, spring = "easy",  style = "slide" })
-- hl.animation({ leaf = "workspaces",          enabled = true, speed = 5, bezier = "quick", style = "slide" })
-- hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 2, bezier = "quick", style = "slide top"})
-- hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2, bezier = "quick", style = "slide bottom"})

-- Curves
hl.curve("snappy",        { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })
hl.curve("easeOutQuint",  { type = "bezier", points = { {0.23, 1},   {0.32, 1}    } })
hl.curve("quick",         { type = "bezier", points = { {0.15, 0},   {0.1, 1}     } })

-- Animations
hl.animation({ leaf = "global",              enabled = true, speed = 3, bezier = "quick" })
-- Pop in slightly when spawned (popin 85% prevents aggressive zoom)
hl.animation({ leaf = "windows",             enabled = true, speed = 3, bezier = "snappy", style = "popin 85%" })
hl.animation({ leaf = "windowsOut",          enabled = true, speed = 2, bezier = "quick",  style = "popin 85%" })
hl.animation({ leaf = "windowsMove",         enabled = true, speed = 3, bezier = "snappy" })
-- Workspaces slide fast and clean
hl.animation({ leaf = "workspaces",          enabled = true, speed = 4, bezier = "snappy", style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn",  enabled = true, speed = 3, bezier = "quick",  style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2, bezier = "quick",  style = "slide bottom" })
