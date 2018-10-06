# ActuateTimeline
Simple timeline for https://github.com/jgranick/actuate
# Example
    var img = new Sprite();
    img.graphics.beginFill(0xffffff);
    img.graphics.drawRect(0,0,10,10);
    img.graphics.endFill();

    addChild(img);

    var tl = new ActuateTimeline();
    tl.tween(img, 1, {x:100});
    tl.addCallback(haxe.Log.trace, ["1"]);
    tl.tween(img, 1, {y:100});
    tl.addCallback(haxe.Log.trace, ["2"]);
    tl.tween(img, 1, {x:0});
    tl.addCallback(haxe.Log.trace, ["3"]);
    tl.tween(img, 1, {y:0});
    tl.addCallback(haxe.Log.trace, ["4"]);