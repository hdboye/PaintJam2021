package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseButton.FlxMouseButtonID;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.util.FlxColor;

// code bad
class MenuState extends FlxState
{
	var menuBg:FlxSprite = new FlxSprite(0, 0);
	var playBtn:FlxSprite = new FlxSprite(270, 500);
	var cursorSprite:FlxSprite = new FlxSprite();

	override public function create():Void
	{
		FlxMouseEventManager.init();
		cursorSprite.loadGraphic("assets/images/cursor.png");
		FlxG.mouse.load(cursorSprite.pixels);
		menuBg.loadGraphic("assets/images/bg.png");
		playBtn.loadGraphic("assets/images/playtouch.png");
		playBtn.loadGraphic("assets/images/playbtn.png");
		add(menuBg);
		add(playBtn);
		FlxMouseEventManager.add(playBtn, startGame, null, null, null, false, true, false, [FlxMouseButtonID.LEFT]);
		FlxG.sound.playMusic("assets/music/menu" + Main.soundExt);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		if (FlxG.mouse.overlaps(playBtn))
			playBtn.loadGraphic("assets/images/playtouch.png");
		else
			playBtn.loadGraphic("assets/images/playbtn.png");
		super.update(elapsed);
	}

	function startGame(spriteShit:FlxSprite)
	{
		FlxG.sound.play("assets/sounds/clicky" + Main.soundExt, 1, false);
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function dirtBag()
		{
			FlxG.switchState(new PlayState());
		});
	}
}
