AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

upbringing_category = Category.create(name:"Upbringing")
around_the_world_category = Category.create(name:"Two Years Around the World")
things_category = Category.create(name:"Things")
movies_category = Category.create(name:"Movies & TV & Theater")
journalism_category = Category.create(name:"Journalism")
friends_category = Category.create(name:"Friends & Family")
places_category = Category.create(name:"Places")

father_tag = Tag.create(name:"Father")
gina_tag = Tag.create(name:"Gina")
pacific_grove_tag = Tag.create(name:"Pacific Grove, CA")
la_tag = Tag.create(name:"Los Angeles, CA")

TagCategory.create!([
                      {tag_id: father_tag.id, category_id: upbringing_category.id},
                      {tag_id: father_tag.id, category_id: friends_category.id},
                      {tag_id: gina_tag.id, category_id: friends_category.id},
                      {tag_id: pacific_grove_tag.id, category_id: upbringing_category.id},
                      {tag_id: pacific_grove_tag.id, category_id: places_category.id},
                      {tag_id: la_tag.id, category_id: upbringing_category.id},
                    ])

drift_wood_lamp_memory = Memory.create(is_live: false,
                                       body: "driftwood lamp made by Peter's father in Pacific Grove, CA during his childhood",
                                       title: "Driftwood Lamp",
                                       occurrence: Date.parse("Jan 1 1955"),
                                       image:'https://via.placeholder.com/1920',
                                       fuzzy_date: decade)

TagMemory.create!([
                    tag_id: father_tag.id, memory_id: drift_wood_lamp_memory.id
                  ])


MemoryCategory.create!([
                         memory_id: drift_wood_lamp_memory.id, category_id: upbringing_category.id,
                         memory_id: drift_wood_lamp_memory.id, category_id: things_category.id
                       ])