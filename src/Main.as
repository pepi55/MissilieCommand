package 
{
	import systems.TurretControlSystem;
	import components.TurretControlComponent;
	import art.TurretArt;
	import components.CollisionComponent;
	import components.DisplayComponent;
	import components.PositionComponent;
	import factories.CarFactory;
	import flash.display.Sprite;
	import flash.events.Event;
	import systems.CollisionSystem;
	import systems.GravitySystem;
	import systems.MovementSystem;
	import systems.RenderSystem;

	public class Main extends Sprite
	{
		private var _engine:Engine;
		
		public function Main()
		{
			// we maken als eerste de engine aan. Deze is het belangrijkste
			_engine = new Engine();
			
			// vervolgens initieren wij de systemen
			// dit doen we door ze toe te voegen aan de engine
			_engine.addSystem(new GravitySystem());
			_engine.addSystem(new TurretControlSystem());
			_engine.addSystem(new MovementSystem());
			_engine.addSystem(new CollisionSystem());
			_engine.addSystem(new RenderSystem());		
			
			// de wereld willen we ook als Entity hebben
			//var world:Entity = new Entity();
			
			//var worldPosition:PositionComponent = new PositionComponent();
			//worldPosition.x = 0;
			//worldPosition.y = 300;
			
			//var worldDisplay:DisplayComponent = new DisplayComponent();
			//worldDisplay.view = new landscape();
			
			//world.add(worldPosition);
			//world.add(worldDisplay);
			
			// we hebben 1 component nodig die door alle objecten gebruikt kan worden
			// deze component bevat een verwijzing naar de wereld
			//var collision:CollisionComponent = new CollisionComponent();
			//collision.world = world;
			
			var singleTurret:Entity = new Entity();
			var turretArt:DisplayComponent = new DisplayComponent();
			var turretPos:PositionComponent = new PositionComponent();
			var turretControl:TurretControlComponent = new TurretControlComponent();
			
			turretPos.x = Math.random() * stage.stageWidth;
			turretPos.y = stage.stageHeight - stage.stageHeight / 4;
			turretArt.view = new TurretArt();
			
			singleTurret.add(turretControl);
			singleTurret.add(turretPos);
			singleTurret.add(turretArt);
			
			/*var carFactory	:	CarFactory	=	new CarFactory();
			
			carFactory.posY = stage.stageHeight - stage.stageHeight / 4;
			carFactory.stageWidth = stage.stageWidth;
			
			for (var i : int = 0; i < 3; i++)
			{
				var turret : Entity	=	carFactory.makeCar(CarFactory.TURRET);
				turret.add(collision);
				addChild(turret.get(DisplayComponent).view);
				// registreer de auto bij de engine zodat de game ook gaat werken
				_engine.addEntity(turret);
			}*/
			
			//_engine.addEntity(world);
			_engine.addEntity(singleTurret);
			
			// laat de auto ook visueel zien
			// we voegen hem toe aan de stage
			//addChild(world.get(DisplayComponent).view);
			addChild(singleTurret.get(DisplayComponent).view);
			
			// start het updaten van het spel
			stage.addEventListener(Event.ENTER_FRAME, updateEngine);
		}

		private function updateEngine(e : Event) : void
		{
			_engine.update();
		}
	}
}