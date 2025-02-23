﻿// BuilderShop.as

#include "Requirements.as"
#include "ShopCommon.as";
#include "WARCosts.as";
#include "CheckSpam.as";

void onInit(CBlob@ this)
{
	AddIconToken( "$dirtdrill$", "dirtdrill.png", Vec2f(16,16), 0 );
	AddIconToken( "$_buildershop_gaslantern$", "gaslantern.png", Vec2f(8,8), 0 );
	AddIconToken( "$handsaw$", "handsaw.png", Vec2f(16,16), 0 );
	AddIconToken( "$chainsaw$", "ChainsawIcon.png", Vec2f(16,16), 0 );
	//AddIconToken( "$drill$", "drill.png", Vec2f(16,16), 0 );
	AddIconToken( "$statue1$", "statue1.png", Vec2f(16,16), 0 );
	AddIconToken( "$statue2$", "statue2.png", Vec2f(16,16), 0 );
	AddIconToken( "$statue3$", "statue3.png", Vec2f(16,16), 0 );
	AddIconToken( "$statue4$", "BatIcon.png", Vec2f(16,16), 0 );
	AddIconToken("$_buildershop_filled_bucket$", "Bucket.png", Vec2f(16, 16), 1);
	this.set_TileType("background tile", CMap::tile_wood_back);

	this.getSprite().SetZ(-50); //background
	this.getShape().getConsts().mapCollisions = false;

	// SHOP
	this.set_Vec2f("shop offset", Vec2f_zero);
	this.set_Vec2f("shop menu size", Vec2f(5, 4));
	this.set_string("shop description", "Buy");
	this.set_u8("shop icon", 25);

	// CLASS
	this.set_Vec2f("class offset", Vec2f(-6, 0));


	{
		ShopItem@ s = addShopItem(this, "Gas Lantern", "$_buildershop_gaslantern$", "gaslantern", "a light", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", 50);
	}
	{
		ShopItem@ s = addShopItem(this, "Filled Bucket", "$_buildershop_filled_bucket$", "filled_bucket", "holds water", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", COST_WOOD_BUCKET);
	}
	{
		ShopItem@ s = addShopItem(this, "Sponge", "$sponge$", "sponge", "clears water", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", COST_WOOD_SPONGE);
	}
	{
		ShopItem@ s = addShopItem(this, "Boulder", "$boulder$", "boulder", "a rock", false);
		AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 35);
	}
	{
		ShopItem@ s = addShopItem(this, "Trampoline", "$trampoline$", "trampoline", "bouncy", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", COST_WOOD_TRAMPOLINE);
	}
	{
		ShopItem@ s = addShopItem(this, "Saw", "$saw$", "saw", "cuts stuff", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", COST_WOOD_SAW);
		AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 100);
	}
	{
		ShopItem@ s = addShopItem(this, "Drill", "$drill$", "drill", "clears blocks", false);
		AddRequirement(s.requirements, "blob", "mat_stone", "Stone", COST_STONE_DRILL);
		AddRequirement(s.requirements, "coin", "", "Coins", 25);
	}

	{
		ShopItem@ s = addShopItem(this, "Advanced Drill", "$advanceddrill$", "advanceddrill", "Advanced machinery that provides better drilling at the cost of it's weight and size", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", 750);
		AddRequirement(s.requirements, "blob", "mat_stone", "stone", 500);
		AddRequirement(s.requirements, "coin", "", "Coins", 500);
	}
	//{
		//ShopItem@ s = addShopItem(this, "Dirt Drill", "$dirtdrill$", "dirtdrill", "Drills longer and cools faster, but drills only dirt.", false);
		//AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 50);
		//AddRequirement(s.requirements, "blob", "mat_wood", "Wood", 300);
	//}

	{
		ShopItem@ s = addShopItem(this, "Chainsaw", "$chainsaw$", "chainsaw", "Mobile saw for cutting wood", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", 100);
		AddRequirement(s.requirements, "blob", "mat_stone", "stone", 50);
	}
	{
		ShopItem@ s = addShopItem(this, "twostarbuilderuniform", "$twostarbuilderuniform$", "twostarbuilderuniform", "Upgraded builder class", false);
		AddRequirement(s.requirements, "blob", "onestarbuilderuniform", "onestarbuilderuniform", 2);
	}
	{
		ShopItem@ s = addShopItem(this, "threestarbuilderuniform", "$threestarbuilderuniform$", "threestarbuilderuniform", "Upgraded builder class", false);
		AddRequirement(s.requirements, "blob", "twostarbuilderuniform", "twostarbuilderuniform", 2);
	}
	{
		ShopItem@ s = addShopItem(this, "Crate", "$crate$", "crate2", "6x6 inventory space", false);
		AddRequirement(s.requirements, "blob", "mat_wood", "Wood", 100);
	}

	// {
		// ShopItem@ s = addShopItem(this, "Praying Statue", "$statue1$", "statue1", "Praying Statue", false, true);
		// AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 50);
	// }
	// {
		// ShopItem@ s = addShopItem(this, "Angel Statue", "$statue2$", "statue2", "Angel Statue", false, true);
		// AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 50);
	// }
	// {
		// ShopItem@ s = addShopItem(this, "Gollum Statue", "$statue3$", "statue3", "Gollum Statue", false, true);
		// AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 50);
	// }
	// {
		// ShopItem@ s = addShopItem(this, "Bat Statue", "$statue4$", "statue4", "Bat Statue", false, true);
		// AddRequirement(s.requirements, "blob", "mat_stone", "Stone", 50);
	// }
	this.set_string("required class", "builder");
}

void GetButtonsFor(CBlob@ this, CBlob@ caller)
{
	if (caller.getConfig() == this.get_string("required class"))
	{
		this.set_Vec2f("shop offset", Vec2f_zero);
	}
	else
	{
		this.set_Vec2f("shop offset", Vec2f(6, 0));
	}
	this.set_bool("shop available", this.isOverlapping(caller));
}

void onCommand(CBlob@ this, u8 cmd, CBitStream @params)
{
	if (cmd == this.getCommandID("shop made item"))
	{
		this.getSprite().PlaySound("/ChaChing.ogg");

		if (!getNet().isServer()) return; /////////////////////// server only past here

		u16 caller, item;
		if (!params.saferead_netid(caller) || !params.saferead_netid(item))
		{
			return;
		}
		string name = params.read_string();
		{
			CBlob@ callerBlob = getBlobByNetworkID(caller);
			if (callerBlob is null)
			{
				return;
			}

			if (name == "filled_bucket")
			{
				CBlob@ b = server_CreateBlobNoInit("bucket");
				b.setPosition(callerBlob.getPosition());
				b.server_setTeamNum(callerBlob.getTeamNum());
				b.Tag("_start_filled");
				b.Init();
				callerBlob.server_Pickup(b);
			}
		}
	}
}

void onHealthChange(CBlob@ this, f32 oldHealth)
{
	CSprite@ sprite = this.getSprite();
	if (sprite !is null) {
		Animation@ destruction = sprite.getAnimation("destruction");
		if (destruction !is null) {
			f32 frame = Maths::Floor((this.getInitialHealth() - this.getHealth()) / (this.getInitialHealth() / sprite.animation.getFramesCount()));
			sprite.animation.frame = frame;
		}
	}
}
