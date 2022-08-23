// scroll script that makes enemies insta gib within some radius

#include "Hitters.as";
#include "RespawnCommandCommon.as"
#include "StandardRespawnCommand.as"
#include "UniformCommon.as"
void onInit( CBlob@ this )
{
	this.addCommandID("onestarpolearm");
}

void GetButtonsFor( CBlob@ this, CBlob@ caller )
{
	CBitStream params;
	params.write_u16(caller.getNetworkID());
	u8 kek = caller.getTeamNum();	
	if (kek == 0)
	{	
		caller.Tag("onestarpolearm");
		caller.CreateGenericButton( 11, Vec2f_zero, this, this.getCommandID("onestarpolearm"), "Use this to change into a stronger polearm.", params );
	}
}