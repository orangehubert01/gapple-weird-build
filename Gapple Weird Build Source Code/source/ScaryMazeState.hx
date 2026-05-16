package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class ScaryMazeState extends MusicBeatState
{
	var path:String = 'scarymaze/';

	var curLevel:Int = 0;

	var dark:FlxSprite;
	var cyan:FlxSprite;

	var title:FlxSprite;
	var playButton:FlxSprite;

	var level:FlxSprite;
	var goal:FlxSprite;

	var borderOne:FlxSprite;
	var borderTwo:FlxSprite;

	override function create()
	{
		dark = new FlxSprite().makeGraphic(1280, 720, FlxColor.BLACK);

		cyan = new FlxSprite().makeGraphic(1280, 720, FlxColor.CYAN);
		cyan.visible = false;

		title = new FlxSprite().loadGraphic(Paths.image(path + 'title'));
		title.screenCenter();

		playButton = new FlxSprite(0, FlxG.height * 0.8).loadGraphic(Paths.image(path + 'play'));
		playButton.screenCenter(X);

		level = new FlxSprite().loadGraphic(Paths.image(path + 'level1'));
		goal = new FlxSprite().loadGraphic(Paths.image(path + 'goal1'));

		for (sprite in [level, goal])
		{
			sprite.scale.set(1.04, 1.04);
			sprite.visible = false;
			sprite.screenCenter();
		}

		borderOne = new FlxSprite();
		borderTwo = new FlxSprite(FlxG.width * 0.86);

		for (border in [borderOne, borderTwo]) border.makeGraphic(180, 720, FlxColor.BLACK);

		for (sprite in [dark, cyan, title, playButton, level, goal, borderOne, borderTwo]) add(sprite);
	}

	override function update(elapsed)
	{
		if (FlxG.mouse.overlaps(playButton) && FlxG.mouse.justPressed && playButton.visible == true)
		{
			for (sprite in [title, playButton]) sprite.visible = false;
			for (sprite in [cyan, level, goal]) sprite.visible = true;
			changeLevel();
		}

		if (FlxG.mouse.overlaps(goal) && goal.visible == true) changeLevel();
		if (FlxG.mouse.overlaps(level) && level.visible == true) resetGame();

		if (FlxG.keys.justPressed.F5) FlxG.resetState();
	}

	function changeLevel()
	{
		curLevel++;

		if (curLevel < 4)
		{
			level.loadGraphic(Paths.image(path + 'level' + curLevel));
			goal.loadGraphic(Paths.image(path + 'goal' + curLevel));
		}

		trace('level: ' + curLevel);
	}

	function resetGame()
	{
		for (sprite in [title, playButton]) sprite.visible = true;
		for (sprite in [cyan, level, goal]) sprite.visible = false;
		
		curLevel = 0;
	}
}