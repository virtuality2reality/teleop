Factory.define :user do |f|
  f.association :roles
  f.sequence(:email) { |n| "john#{n}@doe.com" }
  f.password "secret"
end

Factory.define :client do |f|
  f.sequence(:name) { |n| "Client#{n}" }
end