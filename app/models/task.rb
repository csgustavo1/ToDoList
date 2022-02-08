class Task < ApplicationRecord

    #relationships...................................................................
    has_many :items, inverse_of: :task , dependent: :destroy, :autosave => true
    accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

    #CarrierWave....................................................................... 
    mount_uploader :image, FileUploader
    serialize :images, JSON

    #enums...........................................................................
    enum priority: { baixa: 0, media: 1, alta: 2 }
    enum category: { trabalho: 0, saude: 1, familia: 2, estudo: 3, outros: 4 }

    #validates.......................................................................
    validates :name, presence: true


end
