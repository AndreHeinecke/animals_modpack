-------------------------------------------------------------------------------
-- Mob Framework Mod by Sapier
-- 
-- You may copy, use, modify or do nearly anything except removing this
-- copyright notice. 
-- And of course you are NOT allow to pretend you have written it.
--
--! @file random_drop.lua
--! @brief component containing random drop features
--! @copyright Sapier
--! @author Sapier
--! @date 2012-08-09
--
--! @defgroup randdrop Random Drop subcomponent
--! @brief Component handling all random drops
--! @ingroup framework_int
--! @{
-- Contact sapier a t gmx net
-------------------------------------------------------------------------------

--! @class random_drop
--! @brief random drop features e.g lay eggs
random_drop = {}

--!@}

-------------------------------------------------------------------------------
-- name: callback(entity)
--
--! @brief random drop periodic callback 
--! @memberof random_drop
--
--! @param entity mob calling it
--! @param now current time
-------------------------------------------------------------------------------
function random_drop.callback(entity,now)
	if entity.data.random_drop ~= nil and
		entity.data.random_drop.result ~= "" then

		dbg_mobf.random_drop_lvl3("MOBF: random drop for ".. entity.data.name .." is set")

		if entity.dynamic_data.random_drop.ts_last_drop + entity.data.random_drop.min_delay < now then

			dbg_mobf.random_drop_lvl3("MOBF: enough time passed give drop a chance")
			if math.random() < entity.data.random_drop.chance then
			
				entity.dynamic_data.random_drop.ts_last_drop = now
				
				local entitybasepos = entity.getbasepos(entity)

				--find pos around
				local toput = environment.get_suitable_pos_same_level(entitybasepos,1,entity)

				if toput ~= nil then
					minetest.env:add_entity(toput,entity.data.random_drop.result.."_ent")
					dbg_mobf.random_drop_lvl3("MOBF: adding random drop for "..entity.data.name .. ": "..entity.data.random_drop.result.."_ent" .. " at " .. printpos(toput))
					if entity.data.sound ~= nil then
						sound.play(entitybasepos,entity.data.sound.random_drop)
					end
				else
					dbg_mobf.random_drop_lvl2("MOBF: didn't find a place to put random drop for ".. entity.data.name)
				end
			end
		
		end
	end
end

-------------------------------------------------------------------------------
-- name: register_random_drop(random_drop)
--
--! @brief register random drop item and entity
--! @memberof random_drop
--
--! @param random_drop configuration for random drop feature
-------------------------------------------------------------------------------
function random_drop.register(random_drop)

		--get basename from random drop item name		
		local start_pos = 1
		local end_pos = string.find(random_drop.result,":")

		if end_pos == nil then
			return
		end
		
		local drop_basename = string.sub(random_drop.result,start_pos,end_pos-1)
		local drop_itemname = string.sub(random_drop.result,end_pos+1)
		
		
		if drop_itemname == nil or
			drop_basename == nil then
			return
		end
		
		minetest.log("LOGLEVEL_INFO","MOBF:\tregistering random drop entity: "..":"..random_drop.result.."_ent"..
				" item="..drop_itemname .. " basename=" .. drop_basename)
		
		--Entity
		minetest.register_entity(":"..random_drop.result.."_ent",
			{
				physical 		= true,
				collisionbox 	= {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
				visual 			= "sprite",
				textures 		= {drop_basename .. "_"..drop_itemname..".png"},

				on_activate = function(self,staticdata)

					local now = mobf_get_current_time()
					
					if staticdata == "" then
						self.dropped 	= now
					else
					
						self.dropped = tonumber(staticdata)
					end

					if self.dropped + self.random_drop_max_life < now then
						dbg_mobf.random_drop_lvl2("MOBF: random drop entity timed out")
						self.object:remove()
					end
				end,

				on_punch = function(self, hitter)
					hitter:get_inventory():add_item("main", random_drop.result.." 1")
					self.object:remove()
				end,

				on_step = function(self,dtime)
					if self.dropped + self.random_drop_max_life < mobf_get_current_time() then
						dbg_mobf.random_drop_lvl2("MOBF: random drop entity timed out")
						self.object:remove()
					end
		
				end,


				get_staticdata = function(self)
					return self.dropped
				end,

				random_drop_max_life 	= random_drop.min_delay/4,
				dropped 		= 0,

			})
end

-------------------------------------------------------------------------------
-- name: init_dynamic_data(entity,now)
--
--! @brief initialize dynamic data required by random drop
--! @memberof random_drop
--
--! @param entity mob to add data
--! @param now current time
-------------------------------------------------------------------------------
function random_drop.init_dynamic_data(entity,now)
	if entity.data.random_drop ~= nil and
		entity.data.random_drop.min_delay > 5 then
		entity.dynamic_data.random_drop = {
			ts_last_drop = now + math.random(5,entity.data.random_drop.min_delay)
			}
	else
		entity.dynamic_data.random_drop = {
			ts_last_drop = now
			}
	end
end
