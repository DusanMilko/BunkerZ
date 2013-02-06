package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		//delete later
		[Embed(source="../assets/bar.png")]
		public static const barImg:Class;
		
		[Embed(source="../assets/startBtn.png")]
		public static const startBtnImg:Class;
		
		[Embed(source="../assets/titleImg.png")]
		public static const titleImg:Class;
		
		[Embed(source="../assets/startScreen.png")]
		public static const startScreenBgImg:Class;
		
		[Embed(source="../assets/bg1.png")]
		public static const bg1:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();
		private static var gameTextureAtlas:TextureAtlas; //TextureAtlas is starling built in
		
		[Embed(source="../assets/myTextures.png")]
		public static const AtlasTextureGame:Class;
		
		[Embed(source="../assets/myTextures.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if(gameTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = XML(new AtlasXmlGame);
				gameTextureAtlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture//starling.textures.Texture
		{
			if(gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}