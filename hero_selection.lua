-- mandate that the bots will pick these heroes - for testing purposes
-- similarly grouped by chinese number system
forcedHeroesByPosition = {
  {},
  {},
  {},
  {},
  {}
};

-- grouped according to the chinese number system
botHeroesByPosition = {
	{
		'npc_dota_hero_bloodseeker',
		'npc_dota_hero_bristleback',
		'npc_dota_hero_chaos_knight',
		'npc_dota_hero_drow_ranger',
		'npc_dota_hero_juggernaut',
		'npc_dota_hero_luna',
		'npc_dota_hero_necrolyte',
		'npc_dota_hero_phantom_assassin',
		'npc_dota_hero_sniper',
		'npc_dota_hero_sven',
		'npc_dota_hero_tiny',
		'npc_dota_hero_skeleton_king'
	},
	{
		'npc_dota_hero_axe',
		'npc_dota_hero_bloodseeker',
		'npc_dota_hero_bristleback',
		'npc_dota_hero_death_prophet',
		'npc_dota_hero_dragon_knight',
		'npc_dota_hero_drow_ranger',
		'npc_dota_hero_juggernaut',
		'npc_dota_hero_kunkka',
		'npc_dota_hero_lina',
		'npc_dota_hero_luna',
		'npc_dota_hero_necrolyte',
		'npc_dota_hero_phantom_assassin',
		'npc_dota_hero_pudge',
		'npc_dota_hero_razor',
		'npc_dota_hero_nevermore',
		'npc_dota_hero_sniper',
		'npc_dota_hero_tiny',
		'npc_dota_hero_viper',
		'npc_dota_hero_windrunner',
		'npc_dota_hero_zuus'
	},
	{
		'npc_dota_hero_axe',
		'npc_dota_hero_bounty_hunter',
		'npc_dota_hero_bristleback',
		'npc_dota_hero_dragon_knight',
		'npc_dota_hero_earthshaker',
		'npc_dota_hero_omniknight',
		'npc_dota_hero_pudge',
		'npc_dota_hero_sand_king',
		'npc_dota_hero_tidehunter',
		'npc_dota_hero_windrunner'
	},
	{
		'npc_dota_hero_axe',
		'npc_dota_hero_bane',
		'npc_dota_hero_bounty_hunter',
		'npc_dota_hero_crystal_maiden',
		'npc_dota_hero_dazzle',
		'npc_dota_hero_earthshaker',
		'npc_dota_hero_jakiro',
		'npc_dota_hero_kunkka',
		'npc_dota_hero_lina',
		'npc_dota_hero_lion',
		'npc_dota_hero_omniknight',
		'npc_dota_hero_pudge',
		'npc_dota_hero_sand_king',
		'npc_dota_hero_skywrath_mage',
		'npc_dota_hero_tidehunter',
		'npc_dota_hero_vengefulspirit',
		'npc_dota_hero_warlock',
		'npc_dota_hero_windrunner',
		'npc_dota_hero_witch_doctor'
	},
	{
		'npc_dota_hero_bane',
		'npc_dota_hero_bounty_hunter',
		'npc_dota_hero_crystal_maiden',
		'npc_dota_hero_dazzle',
		'npc_dota_hero_earthshaker',
		'npc_dota_hero_jakiro',
		'npc_dota_hero_lich',
		'npc_dota_hero_lina',
		'npc_dota_hero_lion',
		'npc_dota_hero_omniknight',
		'npc_dota_hero_oracle',
		'npc_dota_hero_skywrath_mage',
		'npc_dota_hero_vengefulspirit',
		'npc_dota_hero_warlock',
		'npc_dota_hero_witch_doctor'
	}
};

-- TODO
-- 1. determine which slots contain players - don't pick for those slots
-- 2. determine what heroes players have picked - don't pick those heroes - DONE
-- 3. implement a delay so we don't pick all the heroes at once
-- 4. copy the default behavior of picking everything at once after players have picked, though
-- 5. alternate picks between teams, so the selection is a little fairer
function Think()
	local radiantOffset = -1;
	local direOffset = 4;

	if ( GetTeam() == TEAM_RADIANT and radiantTeamSelected ~= true ) then
		print("picking radiant team");
		radiantTeamSelected = DraftTeam( radiantOffset );
	elseif ( GetTeam() == TEAM_DIRE and direTeamSelected ~= true ) then
		print("picking dire team");
		direTeamSelected = DraftTeam( direOffset );
	end

end

-- takes an offset value to compare chinese positions w/ hero slots
function DraftTeam( offset )
	for i=1, 5 do
		local hero = GetHeroForPosition( i );
		print("picked " .. hero .. " for slot " .. (i + offset));
		SelectHero( i + offset, hero );
	end
	return true;
end

-- haven't found a better way to get already-picked heroes than just looping over all the players
function GetPickedHeroes()
	local selectedHeroes = {};
	for i=0,9 do
		local hName = GetSelectedHeroName(i);
		if (hName ~= nil) then
			selectedHeroes[hName] = true;
		end
	end
	return selectedHeroes;
end


function GetHeroForPosition( position )
	local hero;
	local forcedHeroOptions = forcedHeroesByPosition[position];
	local positionHeroOptions = botHeroesByPosition[position];
	local selectedHeroes = GetPickedHeroes();

	hero = forcedHeroOptions[RandomInt(1, #forcedHeroOptions)];
	if (hero == nil) then
		hero = positionHeroOptions[RandomInt(1, #positionHeroOptions)];
	end


	while ( selectedHeroes[hero] == true ) do
		print("repicking because " .. hero .. " was taken.")
		hero = positionHeroOptions[RandomInt(1, #positionHeroOptions)];
	end

	return hero;
end
