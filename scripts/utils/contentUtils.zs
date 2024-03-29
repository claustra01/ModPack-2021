#priority 900
#loader contenttweaker

/*--------------------------------------------------
	These scripts are written by delta_nos.
	You can use these to learn scripting
	but not to copy and paste. I will trust you.
--------------------------------------------------*/

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Block;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.SoundType;

import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.Color;
import mods.contenttweaker.IItemColorSupplier;

import mods.contenttweaker.DropHandler;


print("====================: Content Tweaker Utils :====================");

//==================== Add Items ====================

	//---Basic Items---
	function createItem(name as string) {
		VanillaFactory.createItem(name).register();
	}

	//---Colored Items---
	function createColoredItem(name as string, color as string, texture as string) {
		var item = VanillaFactory.createItem(name);
		item.itemColorSupplier = function(item, tintindex) {
			return Color.fromHex(color);
		};
		item.textureLocation = ResourceLocation.create(texture);
		item.register();
	}

	//---Customized Items---
	function createCustomizedItem(name as string, maxSize as int, rarity as string) {
		var item = VanillaFactory.createItem(name);
		item.maxStackSize = maxSize;
		item.rarity = rarity;
		item.register();
	}

//==================== Add Blocks ====================

	//---Basic Blocks---
	function createBlock(name as string, blockType as BlockMaterial, soundType as SoundType, hardness as float, resistance as float, tool as string, toolLevel as int) {
		var block = VanillaFactory.createBlock(name, blockType);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(soundType);
		block.register();
	}

	//---Textured Blocks---
	function createTexturedBlock(name as string, blockType as BlockMaterial, soundType as SoundType, hardness as float, resistance as float, tool as string, toolLevel as int, texture as string) {
		var block = VanillaFactory.createBlock(name, blockType);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(soundType);
		block.textureLocation = ResourceLocation.create(texture);
		block.register();
	}

	//---Droppable Blocks---
	function createHasDropBlock(name as string, blockType as BlockMaterial, soundType as SoundType, hardness as float, resistance as float, tool as string, toolLevel as int, dropName as string[], dropMeta as int[]) {
		var block = VanillaFactory.createBlock(name, blockType);
		block.setBlockHardness(hardness);
		block.setBlockResistance(resistance);
		block.setToolClass(tool);
		block.setToolLevel(toolLevel);
		block.setBlockSoundType(soundType);
		block.setDropHandler(function(drops, world, position, state, fortune) {
			drops.clear();
			for i in 0 to dropName.length {
				var item = itemUtils.getItem(dropName[i], dropMeta[i]);
				drops.add(item);
			}
		});
		block.register();
	}

