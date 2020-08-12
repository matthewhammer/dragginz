package game

import (
	"dragginz-api/dragginz/dsl/entities/game"
	"dragginz-api/dragginz/dsl/templates/entity"
	"dragginz-api/dragginz/dsl/templates/field"
	"dragginz-api/orm/design"
	. "dragginz-api/orm/design/dsl"
)

func init() {

	Store(game.StoreName, func() {

		//
		// Object
		//
		Entity("Object", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					Stores the attributes of anything that is represented in game 
					as a physical object
				`,
			})

			// Primary
			Field("Object", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())
			Field("Opacity", field.OpacityGuide())
			Field("SizeModifier", field.SizeModifier())

			// Relations
			Field("Model", field.Entity("Model"))                            // entity
			Field("Composition", field.OneToMany("ObjectComposition"))       // one to many
			Field("Implementation", field.OneToMany("ObjectImplementation")) //
		})

		//
		// ObjectComposition
		//
		Entity("ObjectComposition", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					Not a join table as the same substance may appear multiple
					times within the list (ie. surface AND core)
				`,
			})

			// Primary
			Field("Object", field.ManyToOne("Object"))
			Field("ObjectComposition", field.ID())
			PrimaryKey("Object", "ObjectComposition")
			Interleave("Object")

			// Fields
			Field("IsSurface", field.Bool())
			Field("IsCore", field.Bool())
			Field("Weighting", field.Weighting())

			// Relations
			Field("Substance", field.Entity("Substance")) // entity
		})

		//
		// ObjectImplementation
		//
		Entity("ObjectImplementation", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					How an Object is implemented, currently via MeshImp.
				`,
			})

			// Primary
			Field("Object", field.ManyToOne("Object"))
			Field("ObjectImplementation", field.ID())
			PrimaryKey("Object", "ObjectImplementation")
			Interleave("Object")

			// Relations
			Field("MeshImp", field.Entity("MeshImp")) // entity
		})

	})

}
