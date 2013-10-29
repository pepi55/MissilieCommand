package art {
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class TurretArt extends Sprite {
		private var gun:Sprite = new Sprite();
		private var turret:Sprite = new Sprite();
		
		public function TurretArt() {
			gun.x = turret.x / 2 - gun.width;
			gun.y = turret.y / 2;
			
			drawTurret();
			drawGun();
			
			addChild(turret);
			addChild(gun);
		}

		private function drawGun() : void {
			gun.graphics.lineStyle(1, 0XFF00FF);
			gun.graphics.beginFill(0XFF0000);
			
			gun.graphics.moveTo(0, -1);
			
			gun.graphics.lineTo(0, 1);
			gun.graphics.lineTo(-15, 1);
			gun.graphics.lineTo(-15, -1);
			gun.graphics.lineTo(0, -1);
			
			gun.graphics.endFill();
		}

		private function drawTurret() : void {
			turret.graphics.lineStyle(1, 0XFF00FF);
			turret.graphics.beginFill(0X00FF00);
			
			turret.graphics.drawCircle(0, 0, 10);
			
//			turret.graphics.lineTo(30, 0);
//			turret.graphics.lineTo(30, 10);
//			turret.graphics.lineTo(0, 10);
//			turret.graphics.lineTo(0, 0);
			
			turret.graphics.endFill();
		}
	}
}
