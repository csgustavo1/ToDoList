FactoryBot.define do
  factory :task do
    id { 10 }   
    name { "teste" }
    description { "teste descrição" }
    completed { true }
    date { DateTime.current.to_date }
  end
end  
