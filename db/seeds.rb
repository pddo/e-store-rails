# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

product = Product.create(
    name: 'Faded SkyBlu Denim Jeans',
    category: 'Household',
    short_desc: 'Mill Oil is an innovative oil filled radiator with the most modern technology. If you are looking for something that can make your interior look awesome, and at the same time give you the pleasant warm feeling during the winter.',
    full_desc: "Beryl Cook is one of Britain's most talented and amusing artists .Beryl's pictures feature women of all shapes and sizes enjoying themselves .Born between the two world wars, Beryl Cook eventually left Kendrick School in Reading at the age of 15, where she went to secretarial school and then into an insurance office. After moving to London and then Hampton, she eventually married her next door neighbour from Reading, John Cook. He was an officer in the Merchant Navy and after he left the sea in 1956, they bought a pub for a year before John took a job in Southern Rhodesia with a motor company. Beryl bought their young son a box of watercolours, and when showing him how to use it, she decided that she herself quite enjoyed painting. John subsequently bought her a child's painting set for her birthday and it was with this that she produced her first significant work, a half-length portrait of a dark-skinned lady with a vacant expression and large drooping breasts. It was aptly named 'Hangover' by Beryl's husband and

It is often frustrating to attempt to plan meals that are designed for one. Despite this fact, we are seeing more and more recipe books and Internet websites that are dedicated to the act of cooking for one. Divorce and the death of spouses or grown children leaving for college are all reasons that someone accustomed to cooking for more than one would suddenly need to learn how to adjust all the cooking practices utilized before into a streamlined plan of cooking that is more efficient for one person creating less",
    price: 149.99,
    stocked: true
)

product.image.attach(
  io: File.open(Rails.root.join("public/img/product/product1.png")),
  filename: 'product1.png'
)

11.times.each_with_index do |idx|
  pro = Product.create(
    name: "Product #{idx}",
    category: 'Household',
    short_desc: "Short Desc #{idx}",
    full_desc: "Full Story #{idx}",
    price: (150 * idx / 2 + 3),
    stocked: (idx % 2) > 0
  )

  pro.image.attach(
    io: File.open(Rails.root.join("public/img/product/product#{(idx + 1) % 9}.png")),
    filename: "product#{idx + 1}.png"
  )
end
