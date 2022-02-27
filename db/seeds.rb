puts

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Categories
upbringing_category = Category.create(name: "Upbringing")
around_the_world_category = Category.create(name: "Two Years Around the World")
things_category = Category.create(name: "Things")
movies_category = Category.create(name: "Movies & TV & Theater")
journalism_category = Category.create(name: "Journalism")
friends_category = Category.create(name: "Friends & Family")
places_category = Category.create(name: "Places")

# Tags
father_tag = Tag.create(name: "Stefan Koper")
gina_tag = Tag.create(name: "Gina")
pacific_grove_tag = Tag.create(name: "Pacific Grove, CA")
la_tag = Tag.create(name: "Los Angeles, CA")
australia_tag = Tag.create(name: "Australia")
mortville_tag = Tag.create(name: "Mortville")
desperate_living_tag = Tag.create(name: "Desperate Living")
farm_tag = Tag.create(name: "The Farm")
waters_tag = Tag.create(name: "John Waters")
zazu_tag = Tag.create(name: "Zazu, the dog")
peter_tag = Tag.create(name: "Peter Koper")
typewriter_tag = Tag.create(name: "Typewriters")
haiti_tag = Tag.create(name: "Haiti")
correspondent_tag = Tag.create(name: "Foreign Correspondent")

TagCategory.create!([
                      { tag_id: father_tag.id, category_id: upbringing_category.id },
                      { tag_id: father_tag.id, category_id: friends_category.id },
                      { tag_id: gina_tag.id, category_id: friends_category.id },
                      { tag_id: pacific_grove_tag.id, category_id: upbringing_category.id },
                      { tag_id: pacific_grove_tag.id, category_id: places_category.id },
                      { tag_id: la_tag.id, category_id: upbringing_category.id },
                      { tag_id: australia_tag.id, category_id: around_the_world_category.id },
                      { tag_id: australia_tag.id, category_id: places_category.id },
                      { tag_id: mortville_tag.id, category_id: places_category.id },
                      { tag_id: mortville_tag.id, category_id: movies_category.id },
                      { tag_id: desperate_living_tag.id, category_id: movies_category.id },
                      { tag_id: farm_tag.id, category_id: places_category.id },
                      { tag_id: waters_tag.id, category_id: friends_category.id },
                      { tag_id: waters_tag.id, category_id: movies_category.id },
                      { tag_id: zazu_tag.id, category_id: friends_category.id },
                      { tag_id: peter_tag.id, category_id: upbringing_category.id },
                      { tag_id: peter_tag.id, category_id: around_the_world_category.id },
                      { tag_id: peter_tag.id, category_id: movies_category.id },
                      { tag_id: peter_tag.id, category_id: journalism_category.id },
                      { tag_id: typewriter_tag.id, category_id: things_category.id },
                      { tag_id: haiti_tag.id, category_id: places_category.id },
                      { tag_id: correspondent_tag.id, category_id: journalism_category.id }
                    ])

#Memories
drift_wood_lamp_memory = Memory.create(is_live: true,
                                       body: "Driftwood lamp made by Peter's father in Pacific Grove, CA during his childhood",
                                       title: "Driftwood Lamp",
                                       image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645547923/Driftwood_lamp_w0t53e.jpg",
                                       occurrence: Date.parse("Jan 1 1955"),
                                       fuzzy_date: :decade)


swimming_with_salties_memory = Memory.create(is_live: true,
                                             body: "Saltwater Crocodiles inhabit a special place of fear and awe in the Australian psyche, where they are affectionately known as “Salties”. In the animal kingdom, they are the largest and most dangerous creature to humans.  They have the strongest bite of any animal, able to crush a full-grown cow’s skull between its jaws.  Flaneur was primevally attracted to the huge killer crocs.",
                                             title: "Flaneur Swims with Killer Croc!!!!!",
                                             occurrence: Date.parse("Apr 7 2015"),
                                             fuzzy_date: :regular)
zazu_in_mortville_memory = Memory.create(is_live: true,
                                         body: "A dejected Zazu wondering why her bucolic farm has been transformed into Mortville for Desperate Living.",
                                         title: "Zazu in Mortville",
                                         image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645548635/Zazu_in_Mortville_taai9x.jpg",
                                         occurrence: Date.parse("Jan 1 1970"),
                                         fuzzy_date: :decade)
carriage_return_memory = Memory.create(is_live: true,
                                       image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645549001/00000003_rrl7d0.jpg",
                                       occurrence: Date.parse("May 1 1971"),
                                       fuzzy_date: :month)
shift_lock_memory = Memory.create(is_live: true,
                                  image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645549071/Friends_02_006_vxpj0r.jpg",
                                  occurrence: Date.parse("Jan 1 1980"),
                                  fuzzy_date: :decade)
always_be_typing_memory = Memory.create(is_live: true,
                                        occurrence: Date.parse("Jan 1 1950"),
                                        image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645548761/Tiny_PK_typing_punh6e.jpg",
                                        fuzzy_date: :decade)
no_one_knew_jimmy_memory = Memory.create(is_live: true,
                                         image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645549165/1980s_California_02_021_lvdsfy.jpg",
                                         occurrence: Date.parse("Jan 1 1980"),
                                         fuzzy_date: :decade)
sombrero_memory = Memory.create(is_live: true,
                                image: "https://res.cloudinary.com/hodsx14x9/image/upload/v1645549157/1980s_California_01_032_nat1iy.jpg",
                                occurrence: Date.parse("Jan 1 1980"),
                                fuzzy_date: :decade)

TagMemory.create!([
                    { tag_id: father_tag.id, memory_id: drift_wood_lamp_memory.id },
                    { tag_id: pacific_grove_tag.id, memory_id: drift_wood_lamp_memory.id },
                    { tag_id: australia_tag.id, memory_id: swimming_with_salties_memory.id },
                    { tag_id: mortville_tag.id, memory_id: zazu_in_mortville_memory.id },
                    { tag_id: desperate_living_tag.id, memory_id: zazu_in_mortville_memory.id },
                    { tag_id: farm_tag.id, memory_id: zazu_in_mortville_memory.id },
                    { tag_id: waters_tag.id, memory_id: zazu_in_mortville_memory.id },
                    { tag_id: zazu_tag.id, memory_id: zazu_in_mortville_memory.id },
                    { tag_id: peter_tag.id, memory_id: carriage_return_memory.id },
                    { tag_id: typewriter_tag.id, memory_id: carriage_return_memory.id },
                    { tag_id: typewriter_tag.id, memory_id: shift_lock_memory.id },
                    { tag_id: peter_tag.id, memory_id: shift_lock_memory.id },
                    { tag_id: haiti_tag.id, memory_id: shift_lock_memory.id },
                    { tag_id: correspondent_tag.id, memory_id: shift_lock_memory.id },
                    { tag_id: peter_tag.id, memory_id: always_be_typing_memory.id },
                    { tag_id: typewriter_tag.id, memory_id: always_be_typing_memory.id },
                    { tag_id: pacific_grove_tag.id, memory_id: always_be_typing_memory.id },
                    { tag_id: la_tag.id, memory_id: no_one_knew_jimmy_memory.id },
                    { tag_id: la_tag.id, memory_id: sombrero_memory.id },
                    { tag_id: father_tag.id, memory_id: sombrero_memory.id }
                  ])

MemoryCategory.create!([
                         { memory_id: drift_wood_lamp_memory.id, category_id: upbringing_category.id },
                         { memory_id: drift_wood_lamp_memory.id, category_id: things_category.id },
                         { memory_id: swimming_with_salties_memory.id, category_id: around_the_world_category.id },
                         { memory_id: swimming_with_salties_memory.id, category_id: places_category.id },
                         { memory_id: zazu_in_mortville_memory.id, category_id: places_category.id },
                         { memory_id: zazu_in_mortville_memory.id, category_id: movies_category.id },
                         { memory_id: zazu_in_mortville_memory.id, category_id: friends_category.id },
                         { memory_id: carriage_return_memory.id, category_id: journalism_category.id },
                         { memory_id: shift_lock_memory.id, category_id: journalism_category.id },
                         { memory_id: shift_lock_memory.id, category_id: upbringing_category.id },
                         { memory_id: always_be_typing_memory.id, category_id: journalism_category.id },
                         { memory_id: always_be_typing_memory.id, category_id: upbringing_category.id },
                         { memory_id: no_one_knew_jimmy_memory.id, category_id: places_category.id },
                         { memory_id: no_one_knew_jimmy_memory.id, category_id: things_category.id },
                         { memory_id: sombrero_memory.id, category_id: places_category.id },
                         { memory_id: sombrero_memory.id, category_id: friends_category.id },
                       ])