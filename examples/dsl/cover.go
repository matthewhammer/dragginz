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
		// CoverT
		//
		Entity("CoverT", entity.Entity(), func() {

			// Base
			Set(design.Entity{
				Description: `
					A Cover Template
				`,
			})

			// Primary
			Field("CoverT", field.ID(), func() {
				PrimaryKey()
			})

			// Fields
			Field("Name", field.Name())
			Field("Description", field.Description())

			// Relations
			Field("Icon", field.Entity("Icon"))                                  // entity
			Field("Resource", field.Entity("Resource"))                          //
			Field("Contributor", field.Entity("Contributor"), field.Nullable())  // entity (nullable)
			Field("Series", field.Entity("Series"), field.Nullable())            //
			Field("Concepts", field.EntityList("ConceptList"), field.Nullable()) // entity list (nullable)
			Field("Tags", field.EntityList("TagList"), field.Nullable())         //

			// Behaviours
			Behaviour(api.NewEntityBehaviour(), func() {
				Set(api.EntityBehaviour{
					Format:   []string{"Icon", "Name"},
					Editable: true,
					Preload:  true,
					Public:   true,
				})
			})
		})

	})

}
