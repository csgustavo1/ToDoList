class Item < ApplicationRecord

  #relationships...................................................................
  belongs_to :task

  #enums...........................................................................
  enum priority: { baixa: 0, media: 1, alta: 2 }
  
end
