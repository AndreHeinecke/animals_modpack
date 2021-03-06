-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
-- 
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice. 
-- And of course you are NOT allow to pretend you have written it.
--
--! @file meadow.lua
--! @brief meadow environment description
--! @copyright Sapier
--! @author Sapier
--! @date 2012-08-10
--
--! @addtogroup environments
--! @{
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

--! @struct env_meadow
--! @brief environment for mobs that prefere green meadows but may walk on 
--! dirt and sand too
env_meadow = {
			media = {
						"air",
						"default:junglegrass"
					},
			surfaces = {
						good = {
							"default:dirt_with_grass"
							},
						possible = {
							"default:dirt",
							"default:sand",
							},
						},
		}
--!@}

environment.register("meadow", env_meadow)