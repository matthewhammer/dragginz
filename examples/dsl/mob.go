package game

import (
	"dragginz-api/dragginz/behaviours/api"
	"dragginz-api/dragginz/dsl/entities/game"
	"dragginz-api/dragginz/dsl/templates/entity"
	"dragginz-api/dragginz/dsl/templates/field"
	"dragginz-api/orm/design"
	. "dragginz-api/orm/design/dsl"
)

func init() {

	Store(game.StoreName, func() {

		//
		// MobT
		// (Mob Template)
		//
		Entity("MobT", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					A MobT is a Mob Template which includes implementation information plus
					game design parameters.

					Examples:
					Mimic King
					Macavity the Purple Cat
					Bob the Builder
				`,
			})

			// Primary
			Field("MobT", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("SizeModifier", field.SizeModifier())

			// Game Design stuff can go here

			// Relations
			Field("Implementation", field.Entity("MobImp"))              // entity
			Field("Resource", field.Entity("Resource"))                  //
			Field("Status", field.Entity("Status"))                      //
			Field("Tags", field.EntityList("TagList"), field.Nullable()) // entity list (nullable)

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

		//
		// MobImp
		// (Mob Implementation)
		//
		Entity("MobImp", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					A MobImp is the implementation of a Mobile Object (player, monster, or NPC)
					including Models and Textures.
					
					There can be many templates based on this Mob Implementation (MobT) with various
					size, clothes, and levels/roles, and other game design parameters.

					Examples:
					Canopy Elf Male
					Mimic
					Black Cat
					Purple Cat
				`,
			})

			// Primary
			Field("MobImp", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Object", field.Entity("Object"))                              // entity
			Field("Status", field.Entity("Status"))                              //
			Field("Concepts", field.EntityList("ConceptList"), field.Nullable()) // entity list (nullable)
			Field("Series", field.Entity("Series"), field.Nullable())            //
			Field("Templates", field.OneToMany("MobT"))                          // one to many

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

	})

}
