package 
{
	import factories.ProjectileFactory;
	import factories.TurretFactory;
	import systems.TurretControlSystem;
	import components.TurretControlComponent;
	import art.TurretArt;
	import components.CollisionComponent;
	import components.DisplayComponent;
	import components.PositionComponent;
	import factories.TurretFactory;
	import flash.display.Sprite;
	import flash.events.Event;
	import systems.CollisionSystem;
	import systems.GravitySystem;
	import systems.MovementSystem;
	import systems.RenderSystem;
	/**
	 * ...
	 * @author Ik
	 */
	public class Main extends Sprite
	{
		private var _engine:Engine;
		
		public function Main()
		{
			_engine = new Engine();
			
			_engine.addSystem(new GravitySystem());
			_engine.addSystem(new TurretControlSystem());
			_engine.addSystem(new MovementSystem());
			//_engine.addSystem(new CollisionSystem());
			_engine.addSystem(new RenderSystem());
			
			var turretControl:TurretControlComponent = new TurretControlComponent();
			
			//Factories
			var missileFactory:ProjectileFactory = new ProjectileFactory();
			var turretFactory:TurretFactory = new TurretFactory();
			
			turretControl.mousePos = this;
			
			missileFactory.stageHeight = stage.stageHeight;
			missileFactory.stageWidth = stage.stageWidth;
			
			for (var j:int = 0; j < 10; j++) 
			{
				var missile:Entity = missileFactory.spawnEnemyMissile(ProjectileFactory.MISSILE);
				addChild(missile.get(DisplayComponent).view);
				_engine.addEntity(missile);
			}
			
			turretFactory.posY = stage.stageHeight - stage.stageHeight / 8;
			turretFactory.stageWidth = stage.stageWidth;
			turretFactory.turretControl = turretControl;
			
			for (var i:int = 0; i < 3; i++)
			{
				var turret:Entity = turretFactory.makeTurret(TurretFactory.TURRET);
				addChild(turret.get(DisplayComponent).view);
				_engine.addEntity(turret);
			}
			
			stage.addEventListener(Event.ENTER_FRAME, updateEngine);
		}

		private function updateEngine(e : Event) : void
		{
			_engine.update();
		}
	}
}