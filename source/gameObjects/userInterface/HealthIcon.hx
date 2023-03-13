//Reverted to old code...
//To do
//:
//Figure out a way to see how wide a sprite's image is, so we can do some shenanigans...

package gameObjects.userInterface;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.FlxGraphic;
import sys.FileSystem;

using StringTools;

class HealthIcon extends FlxSprite
{
	// rewrite using da new icon system as ninjamuffin would say it
	public var sprTracker:FlxSprite;
	public var initialWidth:Float = 0;
	public var initialHeight:Float = 0;
	public var isOldIcon:Bool = false;


	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		updateIcon(char, isPlayer);
	}

	public function updateIcon(char:String = 'bf', isPlayer:Bool = false)
	{
		var trimmedCharacter:String = char;
		if (trimmedCharacter.contains('-'))
			trimmedCharacter = trimmedCharacter.substring(0, trimmedCharacter.indexOf('-'));

		var iconPath = char;
		while (!FileSystem.exists(Paths.getPath('images/icons/icon-' + iconPath + '.png', IMAGE))) {
			if (iconPath != trimmedCharacter)
				iconPath = trimmedCharacter;
			else
				iconPath = 'face';
			trace('$char icon trying $iconPath instead you fuck');
	}

		antialiasing = true;
		var iconGraphic:FlxGraphic = Paths.image('icons/icon-' + iconPath);
		loadGraphic(iconGraphic, true, Std.int(iconGraphic.width / 2), iconGraphic.height);

		initialWidth = width;
		initialHeight = height;
//Codename Engine Shenanigans until ya set the scrollfactor.
		animation.add(char, [for(i in 0...frames.frames.length) i], 0, false, isPlayer);
		antialiasing = true;
		animation.play(char);

		if (frames.frames.length >= 3)
			healthSteps[80] = 2; // winning icon


		scrollFactor.set();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}

//Funkin' Lullaby Shenanigans
	public function swapOldIcon()
	{
		if (isOldIcon = !isOldIcon)
			changeIcon('bf-old');
		else
			changeIcon('bf');
	}



//remove this last line of code when captainkirby returns to the internet 100% aka everywhere thats not twitter
//bet that won't happen
