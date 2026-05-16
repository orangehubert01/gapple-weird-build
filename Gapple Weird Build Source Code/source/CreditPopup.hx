package;

import flixel.group.FlxSpriteGroup;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.math.FlxMath;

class CreditPopup extends FlxSpriteGroup
{
	public var bitchyBalls:FlxSprite;

	public function new(x:Float, y:Float, songy:String)
	{
		super(x, y);
		bitchyBalls = new FlxSprite().makeGraphic(300, 50, FlxColor.WHITE);
		bitchyBalls.alpha = 0.6;
		add(bitchyBalls);

		var funnyText:FlxText = new FlxText(1, 0, 650, 'Placeholder', 16);
		funnyText.setFormat('Comic Sans MS Bold', 32, FlxColor.BLACK, LEFT);
		switch (songy.toLowerCase())
		{
			case 'disruption' | 'applecore' | 'disability' | 'algebra' | 'resumed' | 'sugar-crash' | 'recovered-project' | 'dave-x-bambi-shipping-cute' | 'bookworm' | 'the-big-dingle':
				funnyText.text = 'Song by Grantare';
			case 'wireframe' | 'origin' | 'tantalum' | 'keyboard' | 'galactic' | 'sick-tricks' | 'the-boopadoop-song':
				funnyText.text = 'Song by Cynda';
			case 'deformation':
				funnyText.text = 'Song by Cynda and Aadsta';
				bitchyBalls.scale.set(2.25, 1);
			case 'cuberoot' | 'og' | 'dale' | 'ticking' | 'apprentice':
				funnyText.text = 'Song by Aadsta';
			case 'cell' | 'alternate':
				funnyText.text = 'Song by Wildy';
			case 'wheels' | 'unhinged' | 'poopers':
				funnyText.text = 'Song by Ruby';
			case 'theft':
				funnyText.text = 'Song by NLee';
			case 'slices':
				funnyText.text = 'Song by Top 10 Awesome';
				bitchyBalls.scale.set(1.5, 1);
			case 'strawberry':
				funnyText.text = 'Song by Cynda and Grantare';
				bitchyBalls.scale.set(2.25, 1);
			case 'ready-loud' | 'unfairness':
				funnyText.text = 'Song by MoldyGH';
			case 'gift-card':
				funnyText.text = 'Song by Cval';
			case 'too-shiny':
				funnyText.text = 'Song by Gorbini';
			case 'left-unchecked':
				funnyText.text = 'Song by Saster';
				bitchyBalls.scale.set(1.25, 1);
			case 'sunshine':
				funnyText.text = 'Song by MarStarBro';
				bitchyBalls.scale.set(1.25, 1);
			case 'thunderstorm':
				funnyText.text = 'Song by Saruky';
			case 'collision':
				funnyText.text = 'Song by BeastlyChip';
				bitchyBalls.scale.set(1.15, 1);
			case 'sillier':
				funnyText.text = 'Song by Bmv277';
		}
		add(funnyText);
	}
}
