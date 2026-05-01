package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.system.FlxSound;

class CopyProtectionState extends MusicBeatState
{
	var bg:FlxSprite;
	var textOne:FlxSprite;
	var textTwo:FlxSprite;
	var textThree:FlxSprite;
	var censor:FlxSprite;
	var bandu:FlxSprite;

	var bounceMultiplier:Float = 1;
	var yBullshit:Float = 1;

	override function create()
	{
		FlxG.sound.playMusic(Paths.music('copy protection screen'), 1);

		bg = new FlxSprite().loadGraphic(Paths.image('SCARYSCREEN/demobg'));
		textOne = new FlxSprite(0, -150).loadGraphic(Paths.image('SCARYSCREEN/banduLoves'));
		textTwo = new FlxSprite().loadGraphic(Paths.image('SCARYSCREEN/yesItIs'));
		textThree = new FlxSprite().loadGraphic(Paths.image('SCARYSCREEN/notARealNumberBtw'));
		censor = new FlxSprite().loadGraphic(Paths.image('SCARYSCREEN/number_censor'));
		bandu = new FlxSprite().loadGraphic(Paths.image('SCARYSCREEN/monkey_guy'));
		bandu.scale.set(0.3, 0.3);
		
		for (i in [bg, textOne, textTwo, textThree, censor]) 
		{	
			i.screenCenter();
			add(i);
		}

		add(bandu);

		super.create();
	}

	var elapsedtime:Float = 0;
	
	override function update(elapsed:Float)
	{
		elapsedtime += elapsed;

		if (bandu.x >= (bg.width - 1000) || bandu.y >= (bg.height - 1000))
		{
			bounceMultiplier = FlxG.random.float(-0.75, -1.15);
			yBullshit = FlxG.random.float(0.95, 1.05);
		}
		else if (bandu.x <= (bg.x + 100) || bandu.y <= (bg.y + 100))
		{
			bounceMultiplier = FlxG.random.float(0.75, 1.15);
			yBullshit = FlxG.random.float(0.95, 1.05);
		}

		bandu.angle += elapsed * 20;

		bandu.x += 1 * bounceMultiplier;
		bandu.y += 1 * (bounceMultiplier * yBullshit);

		if (FlxG.keys.pressed.NINE) FlxG.camera.zoom += 0.03;
		if (FlxG.keys.pressed.EIGHT) FlxG.camera.zoom -= 0.03;

		textOne.y += (Math.sin(elapsedtime) * 0.6);
		textThree.setPosition(FlxG.random.float(-2.5, 2.5), FlxG.random.float(-2.5, 2.5));

		super.update(elapsed);
	}
}