# Default awards
@apple = Award.where(title: "Applesauce", value: 10).first_or_create
@apple.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'apple.png')), filename: 'apple.png', content_type: 'image/png')
@garlic = Award.where(title: "Spicy", value: 20).first_or_create
@garlic.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'garlic.png')), filename: 'garlic.png', content_type: 'image/png')
@broc = Award.where(title: "Fresh", value: 30).first_or_create
@broc.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'broccoli.png')), filename: 'broccoli.png', content_type: 'image/png')
@potato = Award.where(title: "Breezy", value: 40).first_or_create
@potato.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'potato.png')), filename: 'potato.png', content_type: 'image/png')
