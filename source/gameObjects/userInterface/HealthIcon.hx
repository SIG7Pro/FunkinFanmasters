//If Alex sees this from getting errors from this, feel free to just revert it back to FE's HealthIcon.hx file.

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
		
		//BELOW TAKEN FROM Theoyeah-Engine, PROBABLY WON'T IMMEDIATELY WORK, EDITED ACCORDINGLY
		
		     //var iconGraphic:FlxGraphic = Paths.image('icons/icon-' + iconPath);
		
			loadGraphic(iconGraphic); //Load stupidly first for getting the file size
			//var frames:Array<Int> = [0, 1, 2];
			var finalWidth = 3;
			switch (file.width)
			{
				case 450:
					finalWidth = 3;
					var frames = [0, 1, 2];
					iconOffsets[0] = (width - 450) / 3;
					iconOffsets[1] = (width - 450) / 3;
				case 300:
					finalWidth = 2;
					var frames = [0, 1];
					iconOffsets[0] = (width - 300) / 2;
					iconOffsets[1] = (width - 300) / 2;
				case 150:
					finalWidth = 1;
					var frames = [0];
					iconOffsets[0] = (width - 150) / 1;
			}
			loadGraphic(iconGraphic, true, Math.floor(width / finalWidth), Math.floor(height)); //Then load it fr
		//ABOVE TAKEN FROM Theoyeah-Engine, PROBABLY WON'T IMMEDIATELY WORK, I'M WORKING ON IT
		
					
		//loadGraphic(iconGraphic, true, Std.int(iconGraphic.width / 2), iconGraphic.height); Originally divides by 2 
		  //since FE was only meant to support 2 icons.

		initialWidth = width;
		initialHeight = height;

		animation.add('icon', [0, 1], 0, false, isPlayer);
		animation.play('icon');
		scrollFactor.set();
		function updateHitbox()

	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
