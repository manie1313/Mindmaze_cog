users_data = [
  {
    email: "diana.culita100@gmail.com",
    password: "password",
    first_name: "Diana",
    last_name: "Culita",
    username: "diana_di",
    age: 26,
    image_url: "https://res.cloudinary.com/dkb0r20o0/image/upload/c_thumb,w_200,g_face/v1747939607/mnljzu26h8hj59ovkzhl.jpg"
  },
  {
    email: "mani@example.com",
    password: "password",
    first_name: "Manel",
    last_name: "M",
    username: "manel_bh",
    age: 30,
    image_url: "https://example.com/avatar/bob.png"
  },
  {
    email: "Luke@example.com",
    password: "password",
    first_name: "Luke",
    last_name: "Burton",
    username: "luke_b",
    age: 28,
    image_url: "https://example.com/avatar/carol.png"
  },
  {
  email: "Teagan@example.com",
  password: "password",
  first_name: "Teagan",
  last_name: "Dorsch",
  username: "Teagan_d",
  age: 28,
  image_url: "https://example.com/avatar/carol.png"
}
]

users_data.map do |data|
  User.create!(
    data.except(:avatar).merge(image_url: data[:avatar])
  )
end
