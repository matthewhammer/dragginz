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
		// Tag
		//
		Entity("Tag", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					tag
				`,
			})

			// Primary
			Field("Tag", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Name"},
					Editable: true,
					Preload:  true,
				})
			})
		})

		//
		// TagClosure
		//
		Entity("TagClosure", entity.Closure("Tag"))

		//
		// TagList
		//
		Entity("TagList", entity.Entity(), func() {

			// Primary
			Field("TagList", field.ID(), func() {
				PrimaryKey()
			})

			// Relations
			Field("Entries", field.OneToMany("TagEntry")) // one to many
		})

		//
		// TagEntry
		//
		Entity("TagEntry", entity.Join("TagList", "Tag"), func() {
			Interleave("TagList")
		})

	})

}
