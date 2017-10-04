-------------------------------------------------------------------------------
-- init.lua for awesomerc                                                    --
-- Copyright (c) 2017 Tom Hartman (thartman@hudco.com)                       --
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
-- Initialize awesome widgets
-- }}}

--- init -- {{{
local widgets = { awesome_cal  = require('awesome-cal' ),
                  awesome_disk = require('awesome-disk'),
                  awesome_pass = require('awesome-pass')
                }

return widgets
-- }}}