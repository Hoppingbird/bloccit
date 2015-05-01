unique_post_create = [
  { title: "Unique Title ", body: "Unique sentence " },
  { title: "Another Unique Title", body: "another unique sentence" },
]

unique_post_create.each do |attributes|
  Post.where(attributes).first_or_create
end