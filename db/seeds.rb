# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Order.destroy_all
OrderItem.destroy_all
Item.destroy_all
User.destroy_all

admin_1 = User.create!(email: "megan@littleshop.com", password: "password", role: 2, active: true, name: "Megan")
admin_2 = User.create!(email: "brian@littleshop.com", password: "password", role: 2, active: true, name: "Brian")

merchant_1 = User.create!(email: "alex@gmail.com", password: "password", role: 1, active: true, name: "Alex")
merchant_2 = User.create!(email: "aurie@gmail.com", password: "password", role: 1, active: true, name: "Aurie")
merchant_3 = User.create!(email: "kyle@gmail.com", password: "password", role: 1, active: true, name: "Kyle")
merchant_4 = User.create!(email: "patrick@gmail.com", password: "password", role: 1, active: true, name: "Patrick")

buyer_1 = User.create!(email: 'buyer1@gmail.com', password: 'password', active: true, name: 'Buyer 1', role: 0)
buyer_1_address = buyer_1.addresses.create!(name: "Home", address: "1234 Test Dr.", city: 'Denver', state: 'CO', zip: '80123')
buyer_2 = User.create!(email: 'buyer2@gmail.com', password: 'password', active: true, name: 'Buyer 2', role: 0)
buyer_2_address = buyer_2.addresses.create!(name: "Home", address: "1234 Test Dr.", city: 'Denver', state: 'CO', zip: '80123')

buyer_3 = User.create!(email: 'buyer3@gmail.com', password: 'password', active: true, name: 'Buyer 3', role: 0)
buyer_3_address = buyer_3.addresses.create!(name: "Home", address: "1234 Test Dr.", city: 'Denver', state: 'CO', zip: '80123')

buyer_4 = User.create!(email: 'buyer4@gmail.com', password: 'password', active: true, name: 'Buyer 4', role: 0)
buyer_4_address = buyer_4.addresses.create!(name: "Home", address: "1234 Test Dr.", city: 'Denver', state: 'CO', zip: '80123')

buyer_5 = User.create!(email: 'buyer5@gmail.com', password: 'password', active: true, name: 'Buyer 5', role: 0)
buyer_5_address = buyer_5.addresses.create!(name: "Home", address: "1234 Test Dr.", city: 'Denver', state: 'CO', zip: '80123')

buyer_6 = User.create!(email: 'buyer6@gmail.com', password: 'password', active: true, name: 'Buyer 6', role: 0)
buyer_6_address = buyer_6.addresses.create!(name: "Home", address: "1234 Test Dr.", city: 'Kansas city', state: 'MO', zip: '80123')

mike = Item.create!(name: 'Mike Trout', active: true, price: 11.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51GOReQ-ckL.jpg', inventory: 168, user: merchant_1)
max = Item.create!(name: 'Max Scherzer', active: true, price: 12.50, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51Q%2Bv6TFHZL.jpg', inventory: 140, user: merchant_3)
clayton = Item.create!(name: 'Clayton Kershaw', active: true, price: 13.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51sOKiT8jwL._SY445_.jpg', inventory: 160, user: merchant_2)
nolan = Item.create!(name: 'Nolan Arenado', active: true, price: 14.44, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/41zv0W8xOsL.jpg', inventory: 150, user: merchant_4)
derek = Item.create!(name: 'Derek Jeter', active: true, price: 18.46, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/61y8sAnxTML._SY606_.jpg', inventory: 130, user: merchant_1)
tony = Item.create!(name: 'Tony Gwynn', active: true, price: 21.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/5107DHIW6OL._SY445_.jpg', inventory: 60, user: merchant_2)
ken = Item.create!(name: 'Ken Griffey', active: true, price: 23.05, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51JtJOXCAnL.jpg', inventory: 24, user: merchant_4)
cal = Item.create!(name: 'Cal Ripken', active: true, price: 28.08, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51h0J4aUSoL._SY445_.jpg', inventory: 88, user: merchant_3)
ryan = Item.create!(name: 'Nolan Ryan', active: true, price: 38.30, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51Mxd3NY6tL.jpg', inventory: 33, user: merchant_1)
jackie = Item.create!(name: 'Jackie Robinson', active: true, price: 42.00, description: 'item_description', image: 'https://i.ebayimg.com/images/g/CDsAAOSwJo5a-Otk/s-l640.jpg', inventory: 42, user: merchant_2)
willie = Item.create!(name: 'Willie Mays', active: true, price: 47.80, description: 'item_description', image: 'http://www.vintagecardprices.com/pics/68802.jpg', inventory: 9, user: merchant_3)
shoeless = Item.create!(name: 'Shoeless Joe Jackson', active: true, price: 64.22, description: 'item_description', image: 'https://www.gfg.com/baseball/jjlarge.jpg', inventory: 12, user: merchant_4)
hank = Item.create!(name: 'Hank Aaron', active: true, price: 66.71, description: 'item_description', image: 'https://i.ebayimg.com/images/g/FNwAAOSwAaJaHxUc/s-l640.jpg', inventory: 4, user: merchant_1)
babe = Item.create!(name: 'Babe Ruth', active: true, price: 71.70, description: 'item_description', image: 'http://content.propertyroom.com/listings/sellers/seller600044/images/homeimgs/600044_1562018161712114.jpg', inventory: 3, user: merchant_2)
mickey = Item.create!(name: 'Mickey Mantle', active: true, price: 113.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51CHfNJEAkL._SY445_.jpg', inventory: 5, user: merchant_3)
honus = Item.create!(name: 'Honus Wagner', active: true, price: 312.00, description: 'item_description', image: 'https://images-na.ssl-images-amazon.com/images/I/51SU9b9GoCL._SY445_.jpg', inventory: 1, user: merchant_4)

order_1 = Order.create!(user: buyer_1, status: 0, address_id: buyer_1_address.id)
order_2 = Order.create!(user: buyer_2, status: 1, created_at: 3.days.ago, updated_at: 1.days.ago, address_id: buyer_2_address.id)
order_3 = Order.create!(user: buyer_3, status: 0, address_id: buyer_3_address.id)
order_4 = Order.create!(user: buyer_4, status: 2, created_at: 9.days.ago, updated_at: 1.days.ago, address_id: buyer_4_address.id)
order_5 = Order.create!(user: buyer_5, status: 0, address_id: buyer_5_address.id)
order_6 = Order.create!(user: buyer_1, status: 2, created_at: 5.days.ago, updated_at: 1.days.ago, address_id: buyer_1_address.id)
order_7 = Order.create!(user: buyer_2, status: 3, created_at: 9.days.ago, updated_at: 1.days.ago, address_id: buyer_2_address.id)
order_8 = Order.create!(user: buyer_3, status: 0, address_id: buyer_3_address.id)
order_9 = Order.create!(user: buyer_4, status: 2, created_at: 2.days.ago, updated_at: 1.days.ago, address_id: buyer_4_address.id)
order_10 = Order.create!(user: buyer_5, status: 2, created_at: 4.days.ago, updated_at: 1.days.ago, address_id: buyer_5_address.id)
order_11 = Order.create!(user: buyer_1, status: 2, created_at: 4.days.ago, updated_at: 1.days.ago, address_id: buyer_1_address.id)
order_12 = Order.create!(user: buyer_2, status: 2, created_at: 2.days.ago, updated_at: 1.days.ago, address_id: buyer_2_address.id)
order_13 = Order.create!(user: buyer_3, status: 2, created_at: 2.days.ago, updated_at: 1.days.ago, address_id: buyer_3_address.id)
order_14 = Order.create!(user: buyer_4, status: 2, created_at: 6.days.ago, updated_at: 1.days.ago, address_id: buyer_4_address.id)
order_15 = Order.create!(user: buyer_5, status: 2, created_at: 3.days.ago, updated_at: 1.days.ago, address_id: buyer_5_address.id)
order_16 = Order.create!(user: buyer_3, status: 2, created_at: 9.days.ago, updated_at: 1.days.ago, address_id: buyer_3_address.id)
order_17 = Order.create!(user: buyer_3, status: 2, created_at: 6.days.ago, updated_at: 1.days.ago, address_id: buyer_3_address.id)
order_18 = Order.create!(user: buyer_3, status: 2, created_at: 4.days.ago, updated_at: 1.days.ago, address_id: buyer_3_address.id)
order_19 = Order.create!(user: buyer_2, status: 2, created_at: 7.days.ago, updated_at: 1.days.ago, address_id: buyer_2_address.id)
order_20 = Order.create!(user: buyer_2, status: 2, created_at: 3.days.ago, updated_at: 1.days.ago, address_id: buyer_2_address.id)

order_item_1 = OrderItem.create!(item: max, order: order_1, quantity: 12, price: max.price * 12, fulfilled: false)
order_item_2 = OrderItem.create!(item: clayton, order: order_2, quantity: 2, price: clayton.price * 2, fulfilled: false)
order_item_3 = OrderItem.create!(item: mike, order: order_3, quantity: 3, price: mike.price * 3, fulfilled: false)
order_item_4 = OrderItem.create!(item: nolan, order: order_4, quantity: 4, price: nolan.price * 4, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_5 = OrderItem.create!(item: mickey, order: order_5, quantity: 5, price: mickey.price * 5, fulfilled: false)
order_item_6 = OrderItem.create!(item: derek, order: order_6, quantity: 6, price: derek.price * 6, fulfilled: true, created_at: 7.days.ago, updated_at: 1.days.ago)
order_item_7 = OrderItem.create!(item: tony, order: order_7, quantity: 2, price: tony.price * 2, fulfilled: true, created_at: 3.days.ago, updated_at: 1.days.ago)
order_item_8 = OrderItem.create!(item: ken, order: order_1, quantity: 3, price: ken.price * 3, fulfilled: false)
order_item_9 = OrderItem.create!(item: cal, order: order_2, quantity: 4, price: cal.price * 4, fulfilled: false)
order_item_10 = OrderItem.create!(item: ryan, order: order_7, quantity: 9, price: ryan.price * 9, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_11 = OrderItem.create!(item: babe, order: order_4, quantity: 1, price: babe.price, fulfilled: true, created_at: 7.days.ago, updated_at: 1.days.ago)
order_item_12 = OrderItem.create!(item: hank, order: order_5, quantity: 2, price: hank.price * 2, fulfilled: false)
order_item_13 = OrderItem.create!(item: shoeless, order: order_6, quantity: 3, price: shoeless.price * 3, fulfilled: true, created_at: 8.days.ago, updated_at: 1.days.ago)
order_item_14 = OrderItem.create!(item: willie, order: order_7, quantity: 4, price: willie.price * 4, fulfilled: true, created_at: 2.days.ago, updated_at: 1.days.ago)
order_item_15 = OrderItem.create!(item: jackie, order: order_1, quantity: 9, price: jackie.price * 9, fulfilled: false)
order_item_16 = OrderItem.create!(item: max, order: order_2, quantity: 21, price: max.price * 21, fulfilled: false)
order_item_17 = OrderItem.create!(item: clayton, order: order_3, quantity: 4, price: clayton.price * 4, fulfilled: false)
order_item_18 = OrderItem.create!(item: mike, order: order_4, quantity: 1, price: mike.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_19 = OrderItem.create!(item: nolan, order: order_5, quantity: 2, price: nolan.price * 2, fulfilled: false)
order_item_20 = OrderItem.create!(item: derek, order: order_3, quantity: 87, price: derek.price * 87, fulfilled: false)
order_item_21 = OrderItem.create!(item: tony, order: order_6, quantity: 23, price: tony.price * 23, fulfilled: true, created_at: 8.days.ago, updated_at: 1.days.ago)
order_item_22 = OrderItem.create!(item: ken, order: order_2, quantity: 1, price: ken.price, fulfilled: false)
order_item_23 = OrderItem.create!(item: cal, order: order_1, quantity: 6, price: cal.price * 6, fulfilled: false)
order_item_24 = OrderItem.create!(item: ryan, order: order_3, quantity: 3, price: ryan.price * 3, fulfilled: false)
order_item_25 = OrderItem.create!(item: honus, order: order_4, quantity: 1, price: honus.price, fulfilled: true, created_at: 6.days.ago, updated_at: 1.days.ago)

order_item_26 = OrderItem.create!(item: max, order: order_8, quantity: 1, price: max.price, fulfilled: false)
order_item_27 = OrderItem.create!(item: max, order: order_9, quantity: 1, price: max.price, fulfilled: true, created_at: 2.days.ago, updated_at: 1.days.ago)
order_item_28 = OrderItem.create!(item: mike, order: order_10, quantity: 1, price: mike.price, fulfilled: true, created_at: 6.days.ago, updated_at: 1.days.ago)
order_item_29 = OrderItem.create!(item: mike, order: order_11, quantity: 1, price: mike.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_30 = OrderItem.create!(item: clayton, order: order_12, quantity: 1, price: clayton.price, fulfilled: true, created_at: 5.days.ago, updated_at: 1.days.ago)
order_item_31 = OrderItem.create!(item: clayton, order: order_13, quantity: 1, price: clayton.price, fulfilled: true, created_at: 3.days.ago, updated_at: 1.days.ago)
order_item_32 = OrderItem.create!(item: nolan, order: order_14, quantity: 1, price: nolan.price, fulfilled: true, created_at: 8.days.ago, updated_at: 1.days.ago)
order_item_33 = OrderItem.create!(item: nolan, order: order_15, quantity: 1, price: nolan.price, fulfilled: true, created_at: 6.days.ago, updated_at: 1.days.ago)
order_item_34 = OrderItem.create!(item: derek, order: order_16, quantity: 1, price: derek.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)
order_item_35 = OrderItem.create!(item: tony, order: order_17, quantity: 1, price: tony.price, fulfilled: true, created_at: 9.days.ago, updated_at: 1.days.ago)
order_item_36 = OrderItem.create!(item: cal, order: order_18, quantity: 1, price: cal.price, fulfilled: true, created_at: 2.days.ago, updated_at: 1.days.ago)
order_item_37 = OrderItem.create!(item: ken, order: order_19, quantity: 1, price: ken.price, fulfilled: true, created_at: 5.days.ago, updated_at: 1.days.ago)
order_item_38 = OrderItem.create!(item: ryan, order: order_20, quantity: 1, price: ryan.price, fulfilled: true, created_at: 4.days.ago, updated_at: 1.days.ago)

coupon_1 = Coupon.create!(user_id: merchant_1.id, name: "Coupon 1", code: "WOW", amount: 50, percent: true)
