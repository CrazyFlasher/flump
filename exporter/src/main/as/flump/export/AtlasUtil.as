//
// Flump - Copyright 2013 Flump Authors

package flump.export {

import com.adobe.images.PNGEncoder;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.utils.IDataOutput;

import mx.graphics.codec.JPEGEncoder;

import starling.textures.Texture;

public class AtlasUtil
{
    public static var jpgQuality:int = 70;
    public static var disablePOT:Boolean;

    public static function writePNG (atlas :Atlas, bytes :IDataOutput) :void {
        bytes.writeBytes(atlas.jpg ? new JPEGEncoder(jpgQuality).encode(atlas.toBitmap()) : PNGEncoder.encode(atlas.toBitmap()));
    }

    public static function toTexture (atlas :Atlas) :Texture {
        var bmd :BitmapData = atlas.toBitmap();
        var tex :Texture = Texture.fromBitmapData(bmd);
        // we do not dispose the BitmapData, so that Starling will restore it on
        // context loss
        return tex;
    }

    public static function toSprite (atlas :Atlas) :Sprite {
        const bd :Bitmap = new Bitmap(atlas.toBitmap());
        const sprite :Sprite = new Sprite();
        sprite.addChild(bd);
        return sprite;
    }
}
}
