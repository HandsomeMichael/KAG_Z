
//names of stuff which should be able to be hit by
//team builders, drills etc

const string[] builder_alwayshit =
{

	"workbench",
	"ladder",
	"military2",
	"military",
	"economy",
	"glider",
	"air",
	"land",
	"naval",
	"ammunition",
	"mgbulletsfactory",
	"trap_block",
	"trap_block2",
   "trap_block3",
   "GoldBrick",
   "musicdisc",
   "bridge",
	"bank",
	
	"pa",
	"gunfactory",
	"mballoonfactory",
	"bisonnursery",
	"sharknursery",
	"gliderfactory",
	"goldfactory",
	"bazookafactory",
	"stonefactory",
	"apartment",
	"tradingpost2",
	"nursery",
	"grainnursery",
	"trader2",
	"bombfactory",
	"fighter",
	"gunship",
	"bomber2",
	"logfactory",
	"ZombiePortal",
	"minefactory",
	
	"bombsfactory",
	"boulderfactory",
	"sawfactory",
	"lanternfactory",

	
	"knightgarrison",
	"missileshipfactory",
	"missilefactory",
	"spikes",
	
	"trapblock",
	"triangle",
	"factory",
	"tunnel",
	"building",
	"quarters",
	"storage",
	"kitchen",
	"flowers",
	"flagfactory",
	"obstructor",
};

//fragments of names, for semi-tolerant matching
// (so we don't have to do heaps of comparisions
//  for all the shops)
const string[] builder_alwayshit_fragment =
{
	"shop",
	"door",
	"platform"
};

bool BuilderAlwaysHit(CBlob@ blob)
{
	if(blob.hasTag("builder always hit"))
	{
		return true;
	}

	string name = blob.getName();
	for(uint i = 0; i < builder_alwayshit.length; ++i)
	{
		if (builder_alwayshit[i] == name)
			return true;
	}
	for(uint i = 0; i < builder_alwayshit_fragment.length; ++i)
	{
		if(name.find(builder_alwayshit_fragment[i]) != -1)
			return true;
	}
	return false;
}

bool isUrgent( CBlob@ this, CBlob@ b )
{
			//enemy players
	return (b.getTeamNum() != this.getTeamNum() || b.hasTag("dead")) && b.hasTag("player") ||
			//tagged
			b.hasTag("builder urgent hit") ||
			//trees
			b.getName().find("tree") != -1 ||
			//spikes
			b.getName() == "spikes";
			
}
