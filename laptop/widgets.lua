-------------------------------------------------------------------------------
-- widgets.lua for Awesome Configuration                                     --
-- Copyright (c) 2017 Tom Hartman (thomas.lees.hartman@gmail.com)            --
--                                                                           --
-- This program is free software; you can redistribute it and/or             --
-- modify it under the terms of the GNU General Public License               --
-- as published by the Free Software Foundation; either version 2            --
-- of the License, or the License, or (at your option) any later             --
-- version.                                                                  --
--                                                                           --
-- This program is distributed in the hope that it will be useful,           --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of            --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             --
-- GNU General Public License for more details.                              --
-------------------------------------------------------------------------------

--- Commentary -- {{{
-- Widget Configuration
-- }}}

--- Widgets -- {{{
local widgets = {}

widgets.spacer = wibox.widget.textbox()
widgets.spacer:set_text(" | ")

widgets.taglist = awful.widget.taglist(s,awful.widget.tagelist,filter.all,
                                       conf.mouse.taglist)

return widgets
-- }}}