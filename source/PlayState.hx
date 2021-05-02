package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseButton.FlxMouseButtonID;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	var bg:FlxSprite = new FlxSprite(0, 0);
	var dialogue:Dialogue;
	var saddialogue:Dialogue;
	var happydialogue:Dialogue;
	var curPlace:String = "idle";
	var inGame:Bool = false;
	var painting:FlxSprite = new FlxSprite(730, 110);
	var gameEnd:Bool = false;
	var bar:FlxSprite = new FlxSprite(960, 0);
	var soupBtn:FlxSprite = new FlxSprite(1020, 130);
	var curPaint:Int = 0;
	var moneyTimer:FlxTimer = new FlxTimer();

	var timerTxt:FlxText = new FlxText();
	var timericon:FlxSprite = new FlxSprite();
	var moneyTotal:FlxText = new FlxText();
	var moneyicon:FlxSprite = new FlxSprite();
	var energyTotal:FlxText = new FlxText(120, 570);
	var energyicon:FlxSprite = new FlxSprite();

	public static var player:Player;
	public static var startGam:Bool = false;
	public static var timer:FlxTimer = new FlxTimer();
	public static var money:Int = 0;
	public static var energy:Float = 100;
	public static var soups:Int = 3;
	public static var losewin:String = 'lose';
	public static var doingSum:Bool = false;
	public static var doingPc:Bool = false;

	override public function create()
	{
		money = 0;
		energy = 70;
		soups = 3;
		doingSum = false;
		doingPc = false;
		startGam = false;
		timer = new FlxTimer();
		curPaint = 0;
		dialogue = new Dialogue("regular", true, [
			"yada yee lololol",
			"oh f",
			"my art assignment1!!",
			"i forgot to do it1!1!",
			"its due in 30 seconds....",
			"uhhhh.. ok lets just",
			"i like soup lets draw soup real quick"
		], "start");
		saddialogue = new Dialogue("sad", false, ["ugh..", "feeling so sleepy..", "no energy..."], "lose");
		happydialogue = new Dialogue("happy", true, [
			"ayo less goooo",
			"i finished my painting!",
			"im gonna get an A+ on this lol!!",
			"im gonna become a professional artist",
			"pog"
		], "win");
		bg.loadGraphic("assets/images/inGame/background.png");
		add(bg);
		FlxG.camera.fade(FlxColor.BLACK, 1, true);
		add(dialogue);
		dialogue.doText();
		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (startGam == true)
		{
			startGam = false;
			trace("start thing");
			startGame();
		}
		if (inGame && gameEnd == false)
		{
			moneyTotal.text = Std.string(Std.int(money));
			energyTotal.text = Std.string(Std.int(energy));
			timerTxt.text = Std.string(Std.int(timer.timeLeft));
			painting.animation.play(Std.string(curPaint), true);
			energy -= 0.03;
			barLoop();
			if (timer.finished || energy < 0.5)
			{
				gameEnd = true;
				FlxG.sound.pause();
				new FlxTimer().start(2, function lolol(shit:FlxTimer)
				{
					add(saddialogue);
					saddialogue.doText();
				}, 1);
			}
			if (curPaint == 4)
			{
				gameEnd = true;
				FlxG.sound.pause();
				new FlxTimer().start(2, function lolol(shit:FlxTimer)
				{
					add(happydialogue);
					happydialogue.doText();
					player.doThing("idle");
				}, 1);
			}
		}
		if (gameEnd == true)
		{
			timer.cancel();
		}
		super.update(elapsed);
	}

	function startGame()
	{
		player = new Player(450, 400);
		barShit();
		timer.start(30, null, 1);
		var go:FlxSprite = new FlxSprite(0, 0);
		go.loadGraphic("assets/images/inGame/go.png");
		go.screenCenter();
		// MIGHT CLEAN THIS MESS UP POST-JAM??
		// no i wont lol
		var hitboxes:Array<FlxSprite> = [new FlxSprite(0, 0), new FlxSprite(0, 0)];
		hitboxes[0].loadGraphic("assets/images/inGame/hitboxes/pcHitbox.png");
		hitboxes[1].loadGraphic("assets/images/inGame/hitboxes/paintHitbox.png");
		hitboxes[0].setPosition(166, 61); // pc hitbox
		hitboxes[1].setPosition(650, 95); // paint hitbox
		for (i in 0...2)
		{
			hitboxes[i].alpha = 0;
			add(hitboxes[i]);
		}
		FlxMouseEventManager.add(hitboxes[0], buySoup, null, null, null, false, true, false, [FlxMouseButtonID.LEFT]);
		FlxMouseEventManager.add(hitboxes[1], paintShit, null, null, null, false, true, false, [FlxMouseButtonID.LEFT]);
		FlxG.sound.pause();
		add(go);
		add(player);
		player.doThing("idle");
		counterShit();
		paintingSetup();
		moneyTimer.start(1, function addCash(shit:FlxTimer)
		{
			money += 1;
		}, 0);
		FlxG.sound.play("assets/sounds/go" + Main.soundExt, 1, false);
		FlxSpriteUtil.fadeOut(go, 1);
		inGame = true;
		FlxG.sound.playMusic("assets/music/ingame" + Main.soundExt, 1, true);
	}

	function buySoup(spriteShit:FlxSprite)
	{
		if (gameEnd == false)
		{
			trace(energy);
			if (soups >= 3 || money < 3 || energy < 10 || doingPc == true)
			{
				FlxG.sound.play("assets/sounds/nope" + Main.soundExt);
			}
			else
			{
				player.doThing("pc");
				money -= 3;
				energy -= 15;
				doingPc = true;
				new FlxTimer().start(5, function addSoup(shit:FlxTimer)
				{
					trace(soups);
					soups += 1;
					doingPc = false;
				}, 1);
			}
		}
	}

	function paintShit(spriteShit:FlxSprite)
	{
		if (gameEnd == false)
		{
			trace(energy);
			if (energy < 70)
			{
				FlxG.sound.play("assets/sounds/nope" + Main.soundExt);
			}
			else
			{
				energy -= 50;
				player.doThing("paint");
				curPaint += 1;
			}
		}
	}

	function ending(end:String)
	{
		losewin = end;
		FlxG.switchState(new LoseState());
	}

	function counterShit()
	{
		timerTxt.setFormat("assets/fonts/vcr.ttf", 128, FlxColor.RED, CENTER, OUTLINE, FlxColor.BLACK);
		timerTxt.screenCenter();
		// im too lazy to replace this one with a setposition
		timerTxt.y = 560;
		timerTxt.x = 555;
		timericon.loadGraphic("assets/images/inGame/timer.png");
		timericon.screenCenter();
		timericon.y = energyTotal.y;
		moneyTotal.setPosition(1050, energyTotal.y);
		moneyicon.loadGraphic("assets/images/inGame/dollar.png");
		moneyicon.setPosition(moneyTotal.x + moneyicon.width + 10, moneyTotal.y - 20);
		moneyicon.setGraphicSize(Std.int(moneyicon.width / 2), Std.int(moneyicon.height / 2));
		moneyTotal.setFormat("assets/fonts/vcr.ttf", 64, FlxColor.fromRGB(247, 226, 156), LEFT, OUTLINE, FlxColor.BLACK);
		moneyTotal.y += 50;
		moneyTotal.x += 20;
		energyicon.loadGraphic("assets/images/inGame/energy.png");
		energyicon.setPosition(energyTotal.x - energyicon.width + 10, energyTotal.y);
		energyicon.setGraphicSize(Std.int(energyicon.width / 2), Std.int(energyicon.height / 2));
		energyTotal.setFormat("assets/fonts/vcr.ttf", 64, FlxColor.fromRGB(247, 226, 156), RIGHT, OUTLINE, FlxColor.BLACK);
		energyTotal.y = moneyTotal.y;
		add(timericon);
		add(timerTxt);
		add(moneyTotal);
		add(energyTotal);
		add(moneyicon);
		add(energyicon);
	}

	function drinkSoup(lol:FlxSprite)
	{
		if (soups <= 0)
		{
			FlxG.sound.play("assets/sounds/nope" + Main.soundExt);
		}
		else
		{
			soups -= 1;
			energy += 40;
		}
	}

	function barShit()
	{
		bar.loadGraphic("assets/images/inGame/barshit.png", true, 307, 118);
		for (i in 0...4)
			bar.animation.add(Std.string(i), [i]);
		soupBtn.loadGraphic("assets/images/inGame/soupbtn.png");
		FlxMouseEventManager.add(soupBtn, drinkSoup, null, null, null, false, true, false, [FlxMouseButtonID.LEFT]);
		add(soupBtn);
		add(bar);
	}

	function barLoop()
	{
		bar.animation.play(Std.string(soups));
	}

	function paintingSetup()
	{
		painting.loadGraphic("assets/images/inGame/painting.png", true, 68, 93);
		for (i in 0...5)
			painting.animation.add(Std.string(i), [i]);
		painting.animation.play("0", true);
		add(painting);
	}
}
