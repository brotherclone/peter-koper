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
australia_tag = Tag.create(name: "Australia")

TagCategory.create!([
                      {tag_id: father_tag.id, category_id: upbringing_category.id},
                      {tag_id: father_tag.id, category_id: friends_category.id},
                      {tag_id: gina_tag.id, category_id: friends_category.id},
                      {tag_id: pacific_grove_tag.id, category_id: upbringing_category.id},
                      {tag_id: pacific_grove_tag.id, category_id: places_category.id},
                      {tag_id: la_tag.id, category_id: upbringing_category.id},
                      {tag_id: australia_tag.id, category_id: around_the_world_category.id},
                      {tag_id: australia_tag.id, category_id: places_category.id},
                    ])

drift_wood_lamp_memory = Memory.create(is_live: true,
                                       body: "Driftwood lamp made by Peter's father in Pacific Grove, CA during his childhood",
                                       title: "Driftwood Lamp",
                                       occurrence: Date.parse("Jan 1 1955"),
                                       image:'https://via.placeholder.com/1920',
                                       fuzzy_date: :decade)
swimming_with_salties_memory = Memory.create(is_live: true,
                                             body:"Saltwater Crocodiles inhabit a special place of fear and awe in the Australian psyche, where they are affectionately known as “Salties”. In the animal kingdom, they are the largest and most dangerous creature to humans.  They have the strongest bite of any animal, able to crush a full-grown cow’s skull between its jaws.  Flaneur was primevally attracted to the huge killer crocs. ",
                                             title: "Flaneur Swims with Killer Croc!!!!!",
                                             occurrence: Date.parse("Apr 7 2015"),
                                             image: 'https://via.placeholder.com/1920',
                                             fuzzy_date: :regular)

TagMemory.create!([
                    {tag_id: father_tag.id, memory_id: drift_wood_lamp_memory.id},
                    {tag_id: pacific_grove_tag.id, memory_id: drift_wood_lamp_memory.id},
                    {tag_id: australia_tag.id, memory_id: swimming_with_salties_memory.id},
                  ])


MemoryCategory.create!([
                         {memory_id: drift_wood_lamp_memory.id, category_id: upbringing_category.id},
                         {memory_id: drift_wood_lamp_memory.id, category_id: things_category.id},
                         {memory_id: swimming_with_salties_memory.id, category_id: around_the_world_category.id},
                         {memory_id: swimming_with_salties_memory.id, category_id: places_category.id},
                       ])