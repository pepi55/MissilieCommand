package art 
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author ik
	 */
	public class MissileArt extends Sprite 
	{
		private var missile:Sprite = new Sprite();
		
		public function MissileArt() 
		{
			drawMissile();
			
			missile.rotation = 180;
			
			addChild(missile);
		}
		
		private function drawMissile():void 
		{
			missile.graphics.lineStyle(1, 0XFFAAAA);
			missile.graphics.beginFill(0XFF6666);
			
			missile.graphics.moveTo(2, 0);
			missile.graphics.lineTo(-2, 0);
			missile.graphics.lineTo(0, -10);
			missile.graphics.lineTo(2, 0);
			missile.graphics.lineTo(2, 5);
			missile.graphics.lineTo(-2, 5);
			missile.graphics.lineTo(-2, 0);
			
			missile.graphics.endFill();
		}
		
	}

}