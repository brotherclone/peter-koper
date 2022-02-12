
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Category.create!([
                   {name: 'Upbringing'},
                   {name: 'Things'},
                   {name: 'Places'},
                   {name: 'Movies, Television, & Theater'},
                   {name: 'Journalism'},
                   {name: 'Friends & Family'}
                 ])
Memory.create!([
                 {title:"Mother", body:"", is_live:false, category_id:1 },
                 {title:"Father", body:"", is_live:false, category_id:1 }
               ])